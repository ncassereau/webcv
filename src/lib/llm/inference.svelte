<script module lang="ts">
	import { PUBLIC_USE_LOCAL_OLLAMA, PUBLIC_HF_INFERENCE_TOKEN } from '$env/static/public';

	import { InferenceClient } from '@huggingface/inference';
	import type { ChatCompletionInputMessage } from '@huggingface/tasks';
	import { marked } from 'marked';
	import { Ollama, type Message } from 'ollama';

	import SystemPrompt from './systemprompt.txt?raw';

	const markdownSpecialChars = new Set(['-', '#', '*', '>', '_', '=', '+', '`', '$']);

	const OLLAMA_API_URL = 'http://localhost:11434';
	const OLLAMA_MODEL = 'hf.co/Qwen/Qwen3-14B-GGUF';
	const HUGGINGFACE_MODEL = 'Qwen/Qwen3-14B';
	const INITIAL_MESSAGE =
		"Hi, I'm Nathan's most loyal LLM assistant! I'm here to answer any question you might have on Nathan's profile.";

	async function* ollama_generate(messages: ChatCompletionInputMessage[]) {
		console.log('OLLAMA');
		const ollama = new Ollama({ host: OLLAMA_API_URL });
		const response = await ollama.chat({
			model: OLLAMA_MODEL,
			messages: messages as Message[],
			stream: true
		});
		for await (const chunk of response) {
			if (chunk.message.content.length > 0) {
				yield chunk.message.content;
			}
		}
	}

	async function* hf_generate(messages: ChatCompletionInputMessage[]) {
		console.log('HUGGINGFACE');
		const client = new InferenceClient(PUBLIC_HF_INFERENCE_TOKEN);
		const response = client.chatCompletionStream({
			model: HUGGINGFACE_MODEL,
			messages: messages,
			provider: 'nebius',
			temperature: 0.6,
			max_tokens: 512,
			top_p: 0.9
		});
		for await (const chunk of response) {
			if (
				chunk.choices &&
				chunk.choices.length > 0 &&
				chunk.choices[0].delta.content &&
				chunk.choices[0].delta.content.length > 0
			) {
				yield chunk.choices[0].delta.content;
			}
		}
	}

	export class Chat {
		messages: ChatCompletionInputMessage[] = $state([]);
		buffer: Array<string> = $state([]);
		currentlyGenerating: boolean = $state(false);
		currentlyPrintingResponse: boolean = $state(false);
		is_empty: boolean = true;

		async fetch_response(messages: ChatCompletionInputMessage[]) {
			this.currentlyGenerating = true;
			let stream: AsyncGenerator<string, void, unknown>;
			if (parseInt(PUBLIC_USE_LOCAL_OLLAMA)) {
				stream = ollama_generate(messages);
			} else {
				stream = hf_generate(messages);
			}
			for await (const item of stream) {
				this.buffer.push(item);
			}
			this.currentlyGenerating = false;
		}

		async print_buffer_content(): Promise<void> {
			this.messages.push({
				role: 'assistant',
				content: ''
			});

			return new Promise((resolve) => {
				let raw_message = '';
				let inCodeBlock = false;
				let inMathBlock = false;

				let id = setInterval(async () => {
					if (this.buffer.length > 0) {
						let element = this.buffer[0];
						let letter = element[0];
						this.buffer[0] = element.slice(1);

						raw_message += letter;

						// Update special block flags
						if (letter === '`' && raw_message.endsWith('```')) {
							inCodeBlock = !inCodeBlock;
						} else if (letter === '$' && raw_message.endsWith('$$')) {
							inMathBlock = !inMathBlock;
						}
						const inSpecialContext = inCodeBlock || inMathBlock;

						let newMsg = {
							...this.messages[this.messages.length - 1]
						};
						if (
							(markdownSpecialChars.has(letter) && !inSpecialContext) ||
							letter === ' ' ||
							letter === '\n'
						) {
							// This is a weird situation, so let's wait until we parse again
							newMsg.content += letter;
						} else {
							newMsg.content = await marked(raw_message);
						}

						// Update the message in the messages array
						this.messages[this.messages.length - 1] = newMsg;

						if (this.buffer[0].length === 0) {
							this.buffer = this.buffer.slice(1);
						}
					} else {
						if (!this.currentlyGenerating) {
							clearInterval(id);
							// Final parse to make sure everything is correctly parsed
							this.messages[this.messages.length - 1].content = await marked(raw_message);
							resolve();
						}
					}
				}, 5);
			});
		}

		async prompt_llm(prompt: string) {
			this.is_empty = false;
			this.currentlyPrintingResponse = true;
			this.fetch_response([
				{ role: 'system', content: SystemPrompt },
				...this.messages.slice(1, this.messages.length),
				{ role: 'user', content: prompt + ' /no_think' }
			]);
			this.messages.push({ role: 'user', content: prompt });
			await this.print_buffer_content();
			this.currentlyPrintingResponse = false;
		}

		isCurrentlyGenerating(): boolean {
			return this.currentlyGenerating || this.currentlyPrintingResponse;
		}
	}

	export class ChatsState {
		chats: Array<Chat> = $state([]);
		focusedChatIdx: number | null = $state(null);

		async createNewChat() {
			if (this.chats.length > 0 && this.chats[this.chats.length - 1].is_empty) {
				return;
			}
			let newchat = new Chat();
			this.chats.push(newchat);
			this.focusedChatIdx = this.chats.length - 1;
			newchat.buffer = [INITIAL_MESSAGE];
			await newchat.print_buffer_content();
			newchat.currentlyPrintingResponse = false;
		}

		async prune() {
			if (this.chats[this.chats.length - 1].is_empty) {
				this.chats.pop();
				if (this.focusedChatIdx === this.chats.length) {
					this.focusedChatIdx = null;
				}
			}
		}
	}

	export let chatsState: ChatsState = new ChatsState();
</script>

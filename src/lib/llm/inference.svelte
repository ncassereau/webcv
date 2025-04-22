<script module lang="ts">
    
import { marked } from 'marked';
import { Ollama } from "ollama";

    
const markdownSpecialChars = new Set(['-', '#', '*', '>', '_', '=', '+', '`', '$']);

interface Message {
    role: "user" | "assistant" | "system";
    content: string;
}

let API_URL = "http://localhost:11434";
let model = "qwen2.5-coder:1.5b";


async function* ollama_generate(messages: Message[]) {
    const ollama = new Ollama({ host: API_URL });
    const response = await ollama.chat({
        model: model,
        messages: messages,
        stream: true,
    });
    for await (const part of response) {
        if (part.message.content.length > 0) {
            yield part.message.content;
        }
    }
}


export class Chat {

    messages: Message[] = $state([]);
    buffer: Array<string> = $state([]);
    currentlyGenerating: boolean = $state(false);
    currentlyPrintingResponse: boolean = $state(false);
    is_empty: boolean = true;


    async fetch_response(messages: Message[]) {
        this.currentlyGenerating = true;
        for await (const item of ollama_generate(messages)) {
            this.buffer.push(item);
        }
        this.currentlyGenerating = false;
    }

    async print_buffer_content(): Promise<void> {
        this.messages.push({
            "role": "assistant",
            "content": ""
        });

        return new Promise(resolve => {
            let raw_message = "";    
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
                    if ((markdownSpecialChars.has(letter) && !inSpecialContext) || letter === " " || letter === "\n") {
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
        this.messages.push({"role": "user", "content": prompt});
        this.fetch_response(this.messages.slice(1, this.messages.length));
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
        newchat.buffer = ["Bonjour, je suis l'assistant de Nathan, promptez-moi !"];
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
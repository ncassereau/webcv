<script lang="ts">

import { fade } from "svelte/transition";
import { marked } from 'marked';

let { onclick } = $props();

let messages = $state([
    {
        "role": "user",
        "content": "Hello!"
    },
    {
        "role": "assistant",
        "content": "OK"
    }
]);
let buffer: Array<string> = $state([]);

async function* generate() {
    const data = [
      { id: 1, name: "# Premier élément\n" },
      { id: 2, name: "Deuxième élément\n" },
      { id: 3, name: "- Troisième élément\n" },
      { id: 4, name: "- Quatrième élzerzerzerzerezrreément\n" },
      { id: 5, name: "- Cinquième élément\n\nOKOK\n\n```python\ndef f(n):\n\treturn n + 1\n```\n\n# Prout !" },
    ];
    
    for (const item of data) {
        await new Promise(resolve => setTimeout(resolve, 1000));
        yield item;
    }
}

async function fetch(resolve: () => void) {
    for await (const item of generate()) {
        buffer.push(item.name);
    }
    resolve();
}

async function write() {
    messages.push({
        "role": "assistant",
        "content": ""
    });
    let raw_message = "";
    
    const markdownSpecialChars = new Set(['-', '#', '*', '>', '_', '=', '+', '`', '$']);
    
    let inCodeBlock = false;
    let inMathBlock = false;
    
    let done = false;
    let id = setInterval(async () => {
        if (buffer.length > 0) {
            let element = buffer[0];
            let letter = element[0];
            buffer[0] = element.slice(1);
            
            raw_message += letter;
            
            // Update special block flags
            if (letter === '`' && raw_message.endsWith('```')) {
                inCodeBlock = !inCodeBlock;
            } else if (letter === '$' && raw_message.endsWith('$$')) {
                inMathBlock = !inMathBlock;
            }
            const inSpecialContext = inCodeBlock || inMathBlock;
    
            if ((markdownSpecialChars.has(letter) && !inSpecialContext) || letter === " " || letter === "\n") {
                // This is a weird situation, so let's wait until we parse again
                messages[messages.length - 1].content += letter;
            } else {
                messages[messages.length - 1].content = await marked(raw_message);
            }
            
            if (buffer[0].length === 0) {
                buffer = buffer.slice(1);
            }
        } else {
            if (done) {
                clearInterval(id);
                // Final parse to make sure everything is correctly parsed
                messages[messages.length - 1].content = await marked(raw_message);
            }
        }
    }, 50);
    fetch(() => done = true);
}

</script>


<div
    class="greyVeil"
    {onclick}
    in:fade={{ duration: 200 }}
    out:fade={{ duration: 50 }}
>
    <div class="modalContainer">

        <div class="modal" role="dialog" onclick={(ev) => {ev.stopPropagation()}}>
            
            <div class="header" aria-label="modal header">
                <div class="closeButton" aria-label="Close modal">
                    <svg viewBox="0 0 100 100" {onclick} xmlns="http://www.w3.org/2000/svg">
                        <line x1=0 y1=0 x2=100 y2=100 />
                        <line x1=0 y1=100 x2=100 y2=0 />
                    </svg>
                </div>
                <div class="title">LLM Inference</div>
            </div>

            <div class="body">

                <button onclick={write}>Write</button>

                <div class="messages">
                    {#each messages as message}
                        <div class="{message["role"]}">
                            {@html message["content"] }
                        </div>
                    {/each}
                </div>

                {buffer}

            </div>
        </div>
    </div>
</div>


<style>

.greyVeil {
    position: fixed;
    left: 0;
    top: 0;
    height: 100vh;
    width: 100vw;
    z-index: 1000;
    background-color: rgba(0, 0, 0, 0.5);
}

.modalContainer {
    display: flex;
    margin-top: 100px;
    justify-content: center;
}

.modal {
    position: relative;
    z-index: 1001;
    background-color: white;
    border-radius: 5px;
    width: 70vw;
    min-width: 100px;
    min-height: 300px;
    max-height: 80vh;
    overflow: scroll;
    display: flex;
    flex-direction: column;
}

.header {
    border-bottom: 1px solid rgb(216, 216, 216);
    position: relative;
    display: flex;
}

.title {
    font-size: 24px;
    font-weight: bold;
}

.title, .body {
    padding: 16px 32px;
}

.messages {
    display: flex;
    flex-direction: column;
    width: 100%;
    gap: 20px;
}

.user, .assistant {
    width: 70%;
    padding-top: 5px;
    padding-bottom: 5px;
}

.user {
    align-self: flex-end;
    text-align: end;
    background-color: #dcf8c6;
    color: #000;
}

.assistant {
    align-self: flex-start;
    background-color: #f1f0f0;
    color: #000;
}

</style>
<script lang="ts">

import { onMount, onDestroy } from "svelte";
import { fade } from "svelte/transition";

import ConversationList from "./conversation-list.svelte";
import ChatMessages from "./chat-messages.svelte";
import { chatsState } from "./inference.svelte";

let { close } = $props();

let user_input: string = $state("");
let chat = $derived(
    chatsState.focusedChatIdx === null ? null : chatsState.chats[chatsState.focusedChatIdx]
);

async function escape_exit(e: KeyboardEvent): Promise<void> {
    if (e.key === "Escape") {
        close();
    }
}

async function newChat() {
    user_input = "";
    chatsState.prune() ;
    chatsState.createNewChat();
}

async function submit_user_input() {
    chat?.prompt_llm(user_input);
    user_input = "";
}

onMount(() => {
    document.addEventListener("keydown", escape_exit);
    setTimeout(async () => {
        if (chatsState.focusedChatIdx === null) chatsState.createNewChat();
    }, 0); // Makes sure that this is executed after rendering
});


onDestroy(() => {
    document.removeEventListener("keydown", escape_exit);
    chatsState.prune();
});

</script>


{#snippet cross(isPlus: boolean, callback: (ev: Event) => Promise<void>)}
    <svg
        viewBox="0 0 100 100"
        role="button"
        class="crossButton"
        tabindex="0"
        onclick={callback}
        onkeydown={(e) => e.key === "Enter" && callback(e)}
        xmlns="http://www.w3.org/2000/svg"
    >
        {#if isPlus}
            <line x1=50 y1=0 x2=50 y2=100 />
            <line x1=0 y1=50 x2=100 y2=50 />
        {:else}
            <line x1=0 y1=0 x2=100 y2=100 />
            <line x1=0 y1=100 x2=100 y2=0 />
        {/if}
    </svg>
{/snippet}


<div
    class="greyVeil"
    onclick={close}
    role="none"
    in:fade={{ duration: 50 }}
    out:fade={{ duration: 50 }}
>
    <div class="modalContainer">

        <div
            class="modal"
            role="dialog"
            onclick={(ev) => {ev.stopPropagation()}}
            onkeydown={() => {}}
            tabindex="0"
        >
            
            <div class="header" aria-label="modal header">
                <div class="closeButton" aria-label="Close modal">
                    {@render cross(true, newChat)}
                    {@render cross(false, close)}
                </div>
                <div class="title">LLM Inference</div>
            </div>

            <div class="body-container">
                <div class="sidebar">
                    <ConversationList />
                </div>
                <div class="body">
                    <ChatMessages {chat} />
                </div>
            </div>

            <div class="user-input">
                <textarea
                    placeholder="Talk to NathanLM"
                    bind:value={user_input}
                    disabled={chat?.isCurrentlyGenerating()}
                    onkeydown={ev => ev.key === "Enter" && ev.ctrlKey && submit_user_input()}
                    ></textarea>

                <button
                    class="submit"
                    aria-label="Send"
                    disabled={chat?.isCurrentlyGenerating()}
                    onkeydown={ev => ev.key === "Enter" && submit_user_input()}
                    onclick={submit_user_input}>
                    <svg
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" 
	                    viewBox="0 0 495.003 495.003"
                        xml:space="preserve">
                        <g>
                            <path d="M164.711,456.687c0,2.966,1.647,5.686,4.266,7.072c2.617,1.385,5.799,1.207,8.245-0.468l55.09-37.616
                                l-67.6-32.22V456.687z"/>
                            <path d="M492.431,32.443c-1.513-1.395-3.466-2.125-5.44-2.125c-1.19,0-2.377,0.264-3.5,0.816L7.905,264.422
                                c-4.861,2.389-7.937,7.353-7.904,12.783c0.033,5.423,3.161,10.353,8.057,12.689l125.342,59.724l250.62-205.99L164.455,364.414
                                l156.145,74.4c1.918,0.919,4.012,1.376,6.084,1.376c1.768,0,3.519-0.322,5.186-0.977c3.637-1.438,6.527-4.318,7.97-7.956
                                L494.436,41.257C495.66,38.188,494.862,34.679,492.431,32.443z"/>
                        </g>
                    </svg>
                </button>
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
    margin-top: 50px;
    justify-content: center;
    padding: 0 10px;
    box-sizing: border-box;
}

.modal {
    overflow-x: auto;
    position: relative;
    z-index: 1001;
    background-color: white;
    border-radius: 5px;
    width: 95%;
    max-width: 800px;
    min-width: 100px;
    min-height: 300px;
    height: 85vh;
    display: flex;
    flex-direction: column;
}

.header {
    background: linear-gradient(to right, #0062cc, #0084ff);
    color: white;
    border-radius: 5px 5px 0 0;
    position: relative;
    display: flex;
    align-items: center;
    padding: 14px 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.closeButton {
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    right: 16px;
    height: 100%;
}

svg.crossButton {
    width: 15px;
    height: 15px;
    stroke-width: 10px;
    stroke: white;
    cursor: pointer;
    padding: 8px;
    border-radius: 50%;
    transition: background-color 0.2s ease;
    stroke-width: 10px;
}

svg.crossButton:hover {
    background-color: rgba(255, 255, 255, 0.15);
}

.title {
    font-size: 18px;
    font-weight: 600;
    letter-spacing: 0.3px;
    padding: 0;
    margin: 0;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.body-container {
    display: flex;
    height: 100%;
    width: 100%;
    position: relative;
    overflow: hidden;
}

.sidebar {
    position: absolute;
    width: 300px;
    height: 100%;
    flex-shrink: 0;
}

.body {
    flex-grow: 1;
    height: 100%;
    overflow-y: auto;
    margin-bottom: 8px;
    padding: 12px 16px 0 16px;
}

.user-input {
    display: flex;
    flex-direction: row;
    align-items: center;
    border-top: 1px solid rgb(216, 216, 216);
    padding: 12px;
    gap: 8px;
}

.user-input textarea {
    margin-left: 0;
    padding: 10px 12px;
    border-radius: 18px;
    flex: 1;
    border: 1px solid #e0e0e0;
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    font-size: 15px;
    resize: none;
    min-height: 24px;
    max-height: 120px;
    transition: border 0.2s ease, box-shadow 0.2s ease;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    margin-left: 12px;
}

.user-input textarea:disabled {
    background-color: lightgrey;
    cursor: not-allowed;
}

.user-input textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 2px 8px rgba(0, 123, 255, 0.15);
}

.user-input textarea::placeholder {
    color: #aaaaaa;
}

.user-input button.submit {
    padding: 8px;
    border: none;
    border-radius: 50%;
    background-color: #007bff;
    transition: all 200ms ease-in-out;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 8px rgba(0, 123, 255, 0.3);
    flex-shrink: 0;
    width: 50px;
    height: 50px;
}

.user-input button:not(:disabled).submit:hover {
    background-color: #0056b3;
    cursor: pointer;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.4);
}

.user-input button:disabled.submit{
    background-color: grey;
    cursor: not-allowed;
    transition: none;
} 

.user-input button.submit:active {
    transform: translateY(1px);
    box-shadow: 0 2px 4px rgba(0, 123, 255, 0.4);
}

.user-input button.submit svg {
    height: 25px;
    width: 25px;
    fill: white;
    transform: rotate(10deg) translateX(-2px);
}

/* Media queries for different screen sizes */
@media (max-width: 768px) {
    .modalContainer {
        margin-top: 30px;
    }
    
    .modal {
        width: 100%;
        max-height: 80vh;
    }
    
    .title {
        font-size: 18px;
    }
    
    .body {
        padding: 10px 12px 0 12px;
    }
}

@media (max-width: 480px) {
    .modalContainer {
        margin-top: 10px;
    }
    
    .modal {
        max-height: 90vh;
    }
    
    .header {
        padding: 12px 16px;
    }
    
    .title {
        font-size: 16px;
    }
    
    .closeButton {
        right: 12px;
    }
    
    .user-input {
        padding: 8px;
    }
    
    .user-input textarea {
        padding: 8px 10px;
        font-size: 14px;
    }
    
    .user-input button.submit {
        width: 36px;
        height: 36px;
    }
    
    .user-input button.submit svg {
        height: 16px;
        width: 16px;
    }
}

</style>

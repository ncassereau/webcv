<script lang="ts">

import { chatsState } from "./inference.svelte";

let whiteRectElement: HTMLElement;
let convListElement: HTMLElement;


function show() {
    convListElement.style.opacity = "1";
    convListElement.style.transform = "translateX(0)";
    convListElement.style.visibility = "visible";
}


function hide() {
    convListElement.style.opacity = "0";
    convListElement.style.transform = "translateX(-20px)";
    setTimeout(() => {
        // I need to check whether or not convListElement still exists, because
        // if the modal gets closed too fast, it may have been destroyed before
        // this callback gets resolved.
        if (convListElement && convListElement.style.opacity === "0") {
            convListElement.style.visibility = "hidden";
        }
    }, 300);
}


function extractTextFromHtml(html: string) {
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = html;
    
    const text = tempDiv.textContent || tempDiv.innerText || '';
    return text;
}


function focus(idx: number) {
    chatsState.focusedChatIdx = idx;
}

</script>

<div
    class="whiteRect"
    role="none"
    bind:this={whiteRectElement}
    onmouseenter={show}
    >
</div>

<div
    class="conv-list"
    bind:this={convListElement}
    role="none"
    onmouseleave={hide}>

    <div class="title">All chats</div>

    <div class="reverse-list">
        {#each chatsState.chats as chat, idx}
            <div
                class="message-preview-container"
                class:selected={chatsState.focusedChatIdx === idx}
                role="button"
                tabindex="0"
                onclick={() => focus(idx)}
                onkeypress={e => e.key === "Enter" && focus(idx)}>
                <div class="message-preview">
                    {extractTextFromHtml(chat.messages[chat.messages.length - 1].content)}
                </div>
            </div>
        {/each}
    </div>

</div>


<style>

.whiteRect {
    position: absolute;
    opacity: 0;
    height: 100%;
    width: 150px;
}

.conv-list {
    position: absolute;
    display: inline-block;
    box-shadow: 2px 0 8px rgba(0, 0, 0, 0.5);
    background-color: white;
    z-index: 1200;
    height: 100%;
    max-width: 300px;
    visibility: hidden;
    opacity: 0;
    transform: translateX(-20px);
    transition: opacity 0.3s ease, transform 0.3s ease;
    overflow-y: auto;
}

.title {
    text-align: center;
    font-weight: 600;
}

.reverse-list {
    display: flex;
    flex-direction: column-reverse;
    justify-content: flex-end;
}

.message-preview-container, .title {
    border-bottom: 1px solid #eee;
    padding: 10px;
    transition: background-color 0.2s ease;
}

.message-preview {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display: block;
    color: #888;
    font-size: 10pt;
    font-style: italic;
    max-width: 100%;
    padding: 8px 0;
}

.message-preview-container.selected {
    background-color: #f0f7ff;
    border-left: 3px solid #0077cc;
    padding-left: 7px;
}

.message-preview-container.selected .message-preview {
    color: #333;
    font-weight: 500;
    font-style: normal;
}

.message-preview-container:hover {
    background-color: #f9f9f9;
    cursor: pointer;
}

.message-preview-container.selected:hover {
    background-color: #e6f2ff;
}

</style>
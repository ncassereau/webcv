<script lang="ts">


import ThinkingDots from "./thinking-dots.svelte";
import { Chat } from "./inference.svelte";

let { chat }: { chat: Chat | null } = $props();

</script>


<div class="chat-messages">
    {#if chat !== null}
        {#each chat.messages as message}
            <div class="message {message["role"]}">
                {#if message["content"].length > 0}
                    {@html message["content"] }
                {:else}
                    <ThinkingDots />
                {/if}
            </div>
        {/each}
        <div class="message-padding-phantom"></div>
    {/if}
</div>


<style>

.chat-messages {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-height: 80vh;
    min-height: 200px;
    gap: var(--spacing-lg);
}

.message {
    word-break: break-word;
    overflow-wrap: break-word;
    max-width: 70%;
    width: fit-content;
    min-width: min(250px, fit-content);
    padding: var(--spacing-sm) var(--spacing-md);
    border-radius: 18px;
    background-color: #676767;
    color: #fff;
}

.message-padding-phantom {
    height: 0.1px;
    width: 100%;
    flex-shrink: 0;
}

@media (max-width: 900px) {
    .message {
        max-width: 100%;
    }
}

.user {
    align-self: flex-end;
    text-align: end;
    border-bottom-right-radius: 5px;
}

.assistant {
    align-self: flex-start;
    border-bottom-left-radius: 5px;
}

:global(
    .chat-messages .message h1,
    .chat-messages .message h2,
    .chat-messages .message h3
) {
    font-weight: 700;
    margin-top: var(--spacing-xs);
    margin-bottom: var(--spacing-sm);
    color: #a3c5ff;
}

:global(.chat-messages .message h1) {
    font-size: 1.5rem;
    line-height: 2rem;
}

:global(.chat-messages .message h2) {
    font-size: 1.25rem;
    line-height: 1.75rem;
}

:global(.chat-messages .message h3) {
    font-size: 1.125rem;
    line-height: 1.75rem;
}

:global(.chat-messages .message :not(pre) code, .chat-messages .message pre) {
    background-color: #282c34;
    color: #abb2bf;
    border-radius: 5px;
    font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
}

:global(.chat-messages .message :not(pre) code) {
    padding: var(--spacing-xs);
    font-size: 0.875rem;
}

:global(.chat-messages .message pre) {
    padding: var(--spacing-sm);
    overflow-x: auto;
    margin: var(--spacing-md) 0;
    border: 1px solid #3e4451;
}

:global(.chat-messages .message p) {
    margin: 0;
    line-height: 1.6;
}

:global(.chat-messages .message ul, .chat-messages .message ol) {
    padding-left: var(--spacing-lg);
    margin: var(--spacing-sm) 0;
}

:global(.chat-messages .message li) {
    margin-bottom: var(--spacing-xs);
}

:global(.chat-messages .message blockquote) {
    border-left: 4px solid #dfe2e5;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    padding: 0px var(--spacing-md) 1px var(--spacing-md);
    background-color: grey;
    margin: var(--spacing-md) 0;
}

:global(.chat-messages .message a) {
    color: #0e2e58;
    text-decoration: none;
}

:global(.chat-messages .message a:hover) {
    text-decoration: underline;
}

:global(.chat-messages .message table) {
    border-collapse: collapse;
    width: 100%;
    margin: var(--spacing-md) 0;
}

:global(.chat-messages .message th, .chat-messages .message td) {
    padding: 0.5rem;
    border: 1px solid #dfe2e5;
}

:global(.chat-messages .message th) {
    background-color: #f6f8fa;
    color: #555;
}

:global(.chat-messages .message img) {
    max-width: 100%;
    border-radius: 5px;
    margin: var(--spacing-md) 0;
}

:global(.chat-messages .message hr) {
    height: 1px;
    background-color: #eaecef;
    border: none;
    margin: var(--spacing-lg) 0;
}

</style>
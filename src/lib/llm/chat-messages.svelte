<script lang="ts">

import ThinkingDots from "./thinking-dots.svelte";
import { messages } from "./inference.svelte";


</script>


<div class="chat-messages">
    {#each messages as message}
        <div class="message {message["role"]}">
            {#if message["content"].length > 0}
                {@html message["content"] }
            {:else}
                <ThinkingDots />
            {/if}
        </div>
    {/each}
</div>


<style>

.chat-messages {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-height: 80vh;
    min-height: 200px;
    gap: 20px;
}

.message {
    word-break: break-word;
    overflow-wrap: break-word;
    max-width: 70%;
    width: fit-content;
    padding: 10px 15px;
    border-radius: 18px;
    background-color: #676767;
    color: #fff;
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
    margin-top: 0.25rem;
    margin-bottom: 0.5rem;
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
    padding: 5px;
    font-size: 0.875rem;
}

:global(.chat-messages .message pre) {
    padding: 10px;
    overflow-x: auto;
    margin: 1rem 0;
    border: 1px solid #3e4451;
}

:global(.chat-messages .message p) {
    margin: 0.75rem 0;
    line-height: 1.6;
}

:global(.chat-messages .message ul, .chat-messages .message ol) {
    padding-left: 1.5rem;
    margin: 0.75rem 0;
}

:global(.chat-messages .message li) {
    margin-bottom: 0.3rem;
}

:global(.chat-messages .message blockquote) {
    border-left: 4px solid #dfe2e5;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    padding: 0px 1rem 1px 1rem;
    background-color: grey;
    margin: 1rem 0;
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
    margin: 1rem 0;
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
    margin: 1rem 0;
}

:global(.chat-messages .message hr) {
    height: 1px;
    background-color: #eaecef;
    border: none;
    margin: 1.5rem 0;
}

</style>
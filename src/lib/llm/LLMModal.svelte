<script lang="ts">

import { fade } from "svelte/transition";

import ChatMessages from "./chat-messages.svelte";
import { write } from "./inference.svelte";

let { onclick } = $props();

</script>


<div
    class="greyVeil"
    {onclick}
    in:fade={{ duration: 50 }}
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
                <ChatMessages />
            </div>

            <div class="user-input">
                <textarea name="" id=""></textarea>
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
    padding: 16px 32px;
}

.body {
    overflow-y: scroll;
    margin-bottom: 16px;
    padding: 16px 32px 0 32px;
}

.user-input {
    border-top: 1px solid rgb(216, 216, 216);
    padding: 16px 32px;
}

.closeButton {
    position: absolute;
    display: flex;
    justify-content: center;
    align-items: center;
    right: 25px;
    height: 100%;
}

.closeButton > svg {
    width: 15px;
    height: 15px;
    stroke-width: 20px;
    stroke: lightgrey;
    cursor: pointer;
}

.closeButton > svg:hover {
    stroke: grey;
}

</style>

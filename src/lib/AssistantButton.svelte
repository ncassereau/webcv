<script lang="ts">

import { fade } from "svelte/transition";

let { onclick }: { onclick: () => void} = $props();

</script>

<div
    class="llm-button-wrapper"
    in:fade={{ duration: 200 }}
    out:fade={{ duration: 50 }}
>
    <div class="llm-button-gradient"></div>
    <picture
        {onclick}
        role="button"
        tabindex="0"
        onkeypress={ev => ev.key === "Enter" && onclick()}
    >
        <source srcset="/moi.webp" type="image/webp">
        <img
            class="llm-button-img"
            src="/moi.jpg"
            alt="LLM assistant"
            loading="lazy" />
    </picture>
</div>


<style>

.llm-button-wrapper {
    position: fixed;
    bottom: 40px;
    right: 60px;
    width: 68px;
    height: 68px;
    border-radius: 50%;
    overflow: hidden;
    z-index: 1001;
}

.llm-button-wrapper:hover {
    cursor: pointer;
}

.llm-button-gradient {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: linear-gradient(45deg, #ff00cc, #3333ff, #00ccff);
    animation: rotate 4s linear infinite;
}

.llm-button-img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 60px;
    height: 60px;
    border-radius: 50%;
    border: 1px solid white;
    object-fit: cover;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

</style>

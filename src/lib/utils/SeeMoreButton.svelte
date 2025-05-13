<script lang="ts">

let {
    expanded = $bindable(false),
    collapseText = "Collapse",
    enlargeText = "See more",
    onclick = () => {},
}: {
    expanded?: boolean,
    collapseText?: string,
    enlargeText?: string,
    onclick?: () => void,
} = $props();


function onbuttonclick() {
    expanded = !expanded;
    onclick();
}

</script>


<button class="toggle-button" onclick={onbuttonclick}>

    {#if expanded}
        <span class="button-text">{collapseText}</span>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="m18 15-6-6-6 6" />
        </svg>
    {:else}
        <span class="button-text">{enlargeText}</span>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M5 12h14" /><path d="m12 5 7 7-7 7" />
        </svg>
    {/if}

</button>


<style>

.toggle-button {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 30px;
    padding: 0.5rem 1.5rem;
    margin: 0.5rem auto;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    z-index: 20;
    transition: all 0.3s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    pointer-events: auto;
    font-size: 0.9rem;
    font-weight: 500;
}

.toggle-button:hover {
    background-color: #f1f3f5;
    box-shadow: 0 3px 8px rgba(0,0,0,0.15);
}

.toggle-button svg {
    width: 20px;
    height: 20px;
    fill: none;
    stroke: black;
    stroke-width: 2;
    stroke-linecap: round;
}

.button-text {
    font-size: 0.9rem;
    font-weight: 500;
}

@media (max-width: 480px) {
    .button-text {
        font-size: 0.8rem;
    }
}

@media (prefers-reduced-motion) {
    .toggle-button {
        transition: none;
    }
}

</style>
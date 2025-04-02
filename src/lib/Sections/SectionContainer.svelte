<script lang="ts">
    
import type { Snippet } from "svelte";

let { id = "", children }: { id: string, children: Snippet } = $props();

</script>

<div {id} class="section-container">
    {@render children()}
</div>


<style>

.section-container {
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
    border-radius: 4px;
    background-color: #fff;
    width: 100%;
    box-sizing: border-box;
    height: fit-content;
    overflow: hidden;
    --title-color: #658f85;
}

.section-container :global(h1) {
    color: var(--title-color);
    margin: 0;
    padding: var(--spacing-md) var(--spacing-lg);
    font-size: 1.5rem;
}

.section-container :global(h2) {
    margin: 0;
    padding: 0 var(--spacing-lg);
    font-size: 1.3rem;
}

.section-container :global(p) {
    padding: 0 var(--spacing-lg);
    margin: var(--spacing-sm) 0;
}

.section-container :global(.section-content) {
    padding: var(--spacing-md) var(--spacing-lg);
}

.section-container :global(.section-header) {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    padding: var(--spacing-md) var(--spacing-lg);
}

:target {
    scroll-margin-top: 2rem;
    animation: highlight-fade 4s ease;
}

@keyframes highlight-fade {
    from { background-color: rgba(255, 230, 0, 0.2); }
    to { background-color: transparent; }
}

</style>
<script lang="ts">
    
import type { Snippet } from "svelte";

let { children }: { children: Snippet } = $props();

</script>

<div class="section-container">
    {@render children()}
</div>


<style>

.section-container {
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 4px;
    background-color: #fff;
    margin-bottom: var(--spacing-lg);
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

.section-container :global(.section-header i) {
    color: #4aa389;
    margin-right: var(--spacing-sm);
    font-size: 1.2rem;
}

</style>
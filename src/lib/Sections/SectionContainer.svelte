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
    margin-bottom: 20px;
    width: 100%;
    box-sizing: border-box;
    height: fit-content;
    overflow: hidden;
    --title-color: #658f85;
}

.section-container :global(h1) {
    color: var(--title-color);
    margin: 0;
    padding: 15px 20px;
    font-size: 1.5rem;
}

.section-container :global(h2) {
    margin: 0;
    padding: 0 20px;
    font-size: 1.3rem;
}

.section-container :global(p) {
    padding: 0 20px;
    margin: 10px 0;
}

.section-container :global(.section-content) {
    padding: 15px 20px;
}

.section-container :global(.section-header) {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    padding: 15px 20px;
}

.section-container :global(.section-header i) {
    color: #4aa389;
    margin-right: 10px;
    font-size: 1.2rem;
}

</style>
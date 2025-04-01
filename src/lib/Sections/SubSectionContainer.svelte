<script lang="ts">
    
import type { Snippet } from "svelte";

let { children }: { children: Snippet } = $props();

</script>


<div class="subsection-container">
    {@render children()}
</div>


<style>

.subsection-container {
    padding: 20px;
}

.subsection-container :global(h1) {
    color: grey;
    font-weight: 700;
    font-size: 24pt;
    display: flex;
    flex-direction: row;
    gap: 0.5rem;
    align-items: center;
}

.subsection-container :global(h1 svg) {
    fill: var(--title-color);
    width: 30px;
    height: 30px;
}

</style>
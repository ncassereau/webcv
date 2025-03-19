<script lang="ts">

import LlmModal from "$lib/LLMModal.svelte";

let displayLLM: boolean = $state(false);

</script>

<button onclick={() => displayLLM = true}>Show LLM</button>

{#if displayLLM}
    <LlmModal onclick={() => displayLLM = false}/>
{/if}

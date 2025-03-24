<script lang="ts">

import LlmModal from "$lib/llm/LLMModal.svelte";

let displayLLM: boolean = $state(false);

</script>

<button onclick={() => displayLLM = true}>Show LLM</button>

{#if displayLLM}
    <LlmModal close={async () => displayLLM = false}/>
{/if}

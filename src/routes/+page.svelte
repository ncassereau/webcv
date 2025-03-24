<script lang="ts">

import AssistantButton from "$lib/assistant-button.svelte";
import LlmModal from "$lib/llm/LLMModal.svelte";
import Sidebar from "$lib/Sidebar.svelte";

let displayLLM: boolean = $state(false);

</script>

<Sidebar />

{#if displayLLM}
    <LlmModal close={async () => displayLLM = false}/>
{:else}
    <AssistantButton onclick={() => displayLLM = true}/>
{/if}

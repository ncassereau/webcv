<script lang="ts">

import AssistantButton from "$lib/assistant-button.svelte";
import LlmModal from "$lib/llm/LLMModal.svelte";
import SectionContainer from "$lib/Sections/SectionContainer.svelte";
import Profile from "$lib/Sections/Profile.svelte";

let displayLLM: boolean = $state(false);

</script>


{#if displayLLM}
    <LlmModal close={async () => displayLLM = false}/>
{:else}
    <AssistantButton onclick={() => displayLLM = true}/>
{/if}


<div class="page-container">
    <div class="col-container">
        <SectionContainer>
            <Profile />
        </SectionContainer>
    </div>
    <div class="col-container">

    </div>
</div>


<style>

:global(body) {
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    font-family: 'Roboto', Arial, sans-serif;
    color: #333;
    line-height: 1.6;
}

:global(*) {
    box-sizing: border-box;
}

.page-container {
    display: grid;
    grid-template-columns: minmax(300px, 1fr) minmax(450px, 2fr);
    gap: 20px;
    /* max-width: 1200px; */
    margin: 0 auto;
    padding: 20px;
    width: 100%;
}

.col-container {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.col-container > :global(*) {
    width: 100%;
}

@media (max-width: 900px) {
    .page-container {
        grid-template-columns: 1fr;
        padding: 15px;
    }
}

@media (max-width: 480px) {
    .page-container {
        padding: 10px;
    }
}

</style>

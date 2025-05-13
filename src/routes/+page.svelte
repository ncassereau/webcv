<script lang="ts">

import AssistantButton from "$lib/AssistantButton.svelte";
import LlmModal from "$lib/llm/LLMModal.svelte";
import SectionContainer from "$lib/Sections/SectionContainer.svelte";
import SubSectionContainer from "$lib/Sections/SubSectionContainer.svelte";
import WorkExperience from "$lib/Sections/WorkExperience/WorkExperience.svelte";
import Teachings from "$lib/Sections/Teachings.svelte";
import Profile from "$lib/Sections/Profile.svelte";
import Footer from "$lib/Footer.svelte";
import Education from "$lib/Sections/Education.svelte";
import Skills from "$lib/Sections/Skills.svelte";
import Summary from "$lib/Sections/Summary.svelte";

let displayLLM: boolean = $state(false);

</script>


{#if displayLLM}
    <LlmModal close={async () => displayLLM = false}/>
{:else}
    <AssistantButton onclick={() => displayLLM = true}/>
{/if}


<div class="page-container">
    <div class="col-container">
        <SectionContainer id="profile">
            <Profile />
        </SectionContainer>

        <SectionContainer id="skills">
            <SubSectionContainer>
                <Skills />
            </SubSectionContainer>
        </SectionContainer>
    </div>
    <div class="col-container">
        <SectionContainer id="summary">
            <SubSectionContainer>
                <Summary />
            </SubSectionContainer>
        </SectionContainer>

        <SectionContainer id="work-exp">
            <SubSectionContainer>
                <WorkExperience />
            </SubSectionContainer>
        </SectionContainer>

        <SectionContainer id="teachings">
            <SubSectionContainer>
                <Teachings />
            </SubSectionContainer>
        </SectionContainer>

        <SectionContainer id="education">
            <SubSectionContainer>
                <Education />
            </SubSectionContainer>
        </SectionContainer>
    </div>
</div>

<Footer />


<style>

:root {
    --spacing-xs: 0.3125rem;
    --spacing-sm: 0.625rem;
    --spacing-md: 0.9375rem;
    --spacing-lg: 1.25rem;
    --spacing-xl: 2rem;
    --spacing-xxl: 2.5rem;
    --border-radius: 0.25rem;
    --icon-size: 1.875rem;
    --shadow-size: 0.5rem;
}

:global(body) {
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    color: #333;
    line-height: 1.6;
}

:global(*) {
    box-sizing: border-box;
}

.page-container {
    display: grid;
    grid-template-columns: minmax(300px, 1fr) minmax(450px, 2fr);
    gap: var(--spacing-lg);
    margin: 0 auto;
    padding: var(--spacing-lg);
    width: 100%;
    max-width: 1400px;
}

.col-container {
    display: flex;
    flex-direction: column;
    gap: var(--spacing-lg);
    width: 100%;
    min-width: 300px;
}

.col-container > :global(*) {
    width: 100%;
}

@media (max-width: 900px) {
    .page-container {
        grid-template-columns: 1fr;
        padding: var(--spacing-md);
    }

    .col-container {
        max-width: 100vw;
    }
}

@media (max-width: 480px) {
    .page-container {
        padding: var(--spacing-sm);
    }
}

</style>

<script lang="ts">

import type { Snippet } from "svelte";
import { slide } from "svelte/transition";

import SeeMoreButton from "$lib/utils/SeeMoreButton.svelte";


let {
    jobTitle,
    employer,
    start,
    end = "",
    current = false,
    description = null,
    children,
}: {
    jobTitle: string,
    employer: string,
    start: string,
    end?: string,
    current?: boolean,
    description?: string | null,
    children: Snippet,
} = $props();

let expanded: boolean = $state(false);

</script>


{#snippet svgCalendar()}
    <svg
        class="calendar-svg"
        version="1.0"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 0 64 64"
        xml:space="preserve"
    >
        <path d="M60,4h-7V3c0-1.657-1.343-3-3-3s-3,1.343-3,3v1H17V3c0-1.657-1.343-3-3-3s-3,1.343-3,3v1H4 C1.789,4,0,5.789,0,8v52c0,2.211,1.789,4,4,4h56c2.211,0,4-1.789,4-4V8C64,5.789,62.211,4,60,4z M18,53c0,0.553-0.447,1-1,1h-6 c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M18,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5 c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M18,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6 c0.553,0,1,0.447,1,1V31z M30,53c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M30,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M30,31 c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V31z M42,53c0,0.553-0.447,1-1,1h-6 c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M42,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5 c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M42,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6 c0.553,0,1,0.447,1,1V31z M54,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M54,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V31z M62,15H2V8 c0-1.104,0.896-2,2-2h7v4c0,1.657,1.343,3,3,3s3-1.343,3-3V6h30v4c0,1.657,1.343,3,3,3s3-1.343,3-3V6h7c1.104,0,2,0.896,2,2V15z" />
    </svg>
{/snippet}


<div class="experience">
    <div class="experience-container">
        <div class="exp-header">
            <div class="job-title">{jobTitle}</div>
            <div class="employer">{employer}</div>
        </div>
        <div class="exp-calendar">
            {@render svgCalendar()} 
            <span class="exp-dates">
                {#if current}
                    {start} - <span class="current-exp">Ongoing</span>
                {:else}
                    {start} - {end}
                {/if}
            </span>
        </div>
    </div>
    {#if description !== null}
        <div class="short-description">{description}</div>
    {/if}
    <div>
        {#if expanded}
            <div class="long-description" transition:slide={{ duration: 300 }}>
                {@render children()}
            </div>
        {/if}

        <SeeMoreButton
            collapseText="See less"
            enlargeText="See more"
            bind:expanded
        />
    </div>

</div>


<style>

.experience {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.experience-container {
    display: grid;
    gap: 0.5rem;
}

.exp-header {
    display: grid;
    grid-template-columns: minmax(auto, max-content) minmax(auto, max-content);
    gap: 0;
    align-items: baseline;
}

.job-title {
    font-weight: bold;
    font-size: clamp(1.1rem, 1rem + 0.5vw, 16pt);
    padding-right: 0.5rem;
    white-space: nowrap;
}

.employer {
    font-style: italic;
    font-size: clamp(1.1rem, 1rem + 0.5vw, 16pt);
    position: relative;
    padding-left: 1rem;
}

.employer::before {
    content: "•";
    position: absolute;
    left: 0.25rem;
    color: #888;
    font-style: normal;
}

@media (max-width: 640px) {
    .exp-header {
        grid-template-columns: 1fr;
    }
    
    .job-title {
        white-space: normal;
        padding-right: 0;
    }
    
    .employer {
        padding-left: 0;
    }
    
    .employer::before {
        display: none;
    }
}

.exp-calendar {
    display: grid;
    grid-template-columns: auto 1fr;
    gap: 1rem;
    align-items: center;
    margin-top: 0.25rem;
}

.calendar-svg {
    fill: var(--title-color);
    width: 30px;
    height: 30px;
}

.exp-dates {
    font-style: italic;
    color: var(--title-color);
    font-weight: bold;
}

.current-exp {
    font-style: normal;
    font-weight: bold;
    background-color: var(--title-color);
    padding: var(--spacing-xs);
    border-radius: 0.5rem;
    color: white;
    white-space: nowrap;
}

.long-description {
    border: 1px solid #eee;
    border-radius: 10px;
    padding-right: 1rem;
}
</style>

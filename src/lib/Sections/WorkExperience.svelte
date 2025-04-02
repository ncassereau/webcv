<script lang="ts">

import { onMount } from "svelte";
import { slide } from "svelte/transition";

import SeeMoreButton from "$lib/utils/SeeMoreButton.svelte";


let expandedItems = $state(new Set("idris"));

function toggleItem(id: string) {
    if (expandedItems.has(id)) {
        expandedItems.delete(id);
    } else {
        expandedItems.add(id);
    }
    expandedItems = new Set(expandedItems);
}

onMount(() => {
    expandedItems.add("idris");
    expandedItems = new Set(expandedItems);
});
</script>


<h1>
    <svg
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 10.27 122.88 95.88"
        xml:space="preserve"
        class="suitcase-svg"
    >
        <path d="M8.79,17.04h10.27v82.79H8.79C3.95,99.83,0,95.88,0,91.04V25.82C0,20.99,3.95,17.04,8.79,17.04L8.79,17.04z M52.34,0h17.49c5.44,0,9.89,4.45,9.89,9.89v5.28h-6.3v-5.3c0-1.91-1.56-3.47-3.47-3.47H52.22c-1.91,0-3.47,1.56-3.47,3.47v5.3 h-6.3V9.89C42.45,4.45,46.9,0,52.34,0L52.34,0z M24.28,17.04h73.15v82.79H24.28V17.04L24.28,17.04z M102.65,17.04h11.44 c4.83,0,8.79,3.95,8.79,8.79v65.22c0,4.83-3.95,8.79-8.79,8.79h-11.44V17.04L102.65,17.04z" />
    </svg>
    Work Experience
</h1>


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


<div class="all-experiences">
    <div class="experience">
        <div class="exp-header">
            <div class="job-title">Artificial Intelligence Expert Engineer</div>
            <div class="employer">IDRIS (CNRS)</div>
        </div>
        <div class="exp-calendar">
            {@render svgCalendar()} 
            <span class="exp-dates">
                May 2021 - <span class="current-exp">Current</span>
            </span>
        </div>
        <div class="short-description">
            As an artificial intelligence engineer, I did some stuff...
        </div>
        <div>
            {#if expandedItems.has("idris")}
                <div class="long-description" transition:slide={{ duration: 300 }}>
                    Test
                    <a target="_self" href="#teachings">go to teachings</a>
                </div>
            {/if}

            <SeeMoreButton
                collapseText="See less"
                enlargeText="See more"
                expanded={expandedItems.has("idris")}
                onclick={() => toggleItem("idris")}
            />
        </div>
    
    </div>
    
    <hr />

</div>


<style>

.suitcase-svg {
    fill-rule: evenodd;
    clip-rule: evenodd;
    transform: scale(0.9);
}

.all-experiences {
    margin: 0 2rem;
}

.experience {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.exp-header {
    display: flex;
    flex-direction: row;
    gap: 10px;
}
.exp-header>:not(:first-child) {
    border-left: 2px solid #888;
    padding-left: 10px;
}

.job-title {
    font-weight: bold;
    font-size: 16pt;
}

.employer {
    font-style: italic;
    font-size: 16pt;
}

.calendar-svg {
    fill: var(--title-color);
    width: 30px;
    height: 30px;
}

.exp-calendar {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 1rem;
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
}

.long-description {
    background-color: grey;
}

hr {
    height: 12px;
    width: 85%;
    border: none;
    position: relative;
    margin: 30px auto;
}

hr:before {
    content: "";
    position: absolute;
    top: 6px;
    left: 0;
    right: 0;
    height: 1px;
    background: #ddd;
}

hr:after {
    content: "•";
    position: absolute;
    left: 50%;
    top: 0px;
    transform: translateX(-50%);
    background-color: white;
    padding: 0 15px;
    color: #555;
    font-size: 12px;
    transform: scale(2);
    line-height: 12px;
}

</style>

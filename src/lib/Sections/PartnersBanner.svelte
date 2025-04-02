<script lang="ts">

import { onMount, onDestroy } from "svelte";

import { fade } from "svelte/transition";
import { cubicOut } from "svelte/easing";
import { Tween } from "svelte/motion";

let logos = [
    { url: '/Partners/rte.svg', alt: 'RTE' },
    { url: '/Partners/engie.svg', alt: 'ENGIE' },
    { url: '/Partners/cea.svg', alt: 'CEA' },
    { url: '/Partners/edf.svg', alt: 'EDF' },
    { url: '/Partners/meteofrance.svg', alt: 'MétéoFrance' },
    { url: '/Partners/francetravail.svg', alt: 'France Travail' },
    { url: '/Partners/cnrs.svg', alt: 'CNRS' },
    { url: '/Partners/centralesupelec.svg', alt: 'CentraleSupélec' },
    { url: '/Partners/collegedefrance.webp', alt: 'Collège de France' },
    { url: '/Partners/ens.webp', alt: 'ENS' },
    { url: '/Partners/idemia.svg', alt: 'IDEMIA' },
    { url: '/Partners/inria.svg', alt: 'INRIA' },
    { url: '/Partners/inserm.svg', alt: 'INSERM' },
    { url: '/Partners/ministere.svg', alt: 'Ministères des finances / de la justice / de la transition écologique / de l\'intérieur' },
    { url: '/Partners/onera.svg', alt: 'ONERA' },
    { url: '/Partners/pasteur.svg', alt: 'Institut Pasteur' },
    { url: '/Partners/polytechnique.webp', alt: 'École Polytechnique' },
    { url: '/Partners/sorbonne.svg', alt: 'Sorbonne Université' },
    { url: '/Partners/synchroton.webp', alt: 'Synchrotron Soleil' },
    { url: '/Partners/thales.svg', alt: 'Thales' }
];

let expanded = $state(false);

let containerHeight = new Tween(100, { duration: 600, easing: cubicOut });
let logoContainer: HTMLElement;

function updateContainerSize() {
    containerHeight.target = expanded ? logoContainer.scrollHeight : 100;
}

function toggleLogosDisplay() {
    expanded = !expanded;
    updateContainerSize();
}

let buttonText = $derived(expanded ? "Collapse" : "See all partners");

</script>


<div class="partners-section">
    <div 
        class="logo-container" 
        bind:this={logoContainer}
        style="height: {containerHeight.current}px;"
    >
        {#each logos as logo}
            <div class="logo-item">
                <img
                    src={logo.url}
                    alt={logo.alt}
                    loading="lazy"
                    class="logo-image"
                    draggable="false"
                />
            </div>
        {/each}

        <br/>

        <div class="many-other">
            and many other...
        </div>
        
        {#if !expanded}
            <div class="blur-mask" transition:fade={{duration: 400}}></div>
        {/if}
    </div>
    
    <button class="toggle-button" onclick={toggleLogosDisplay}>
        <span class="button-text">{buttonText}</span>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            {#if !expanded}
                <path d="M5 12h14" /><path d="m12 5 7 7-7 7" />
            {:else}
                <path d="m18 15-6-6-6 6" />
            {/if}
        </svg>
    </button>
    
    <div class="partners-footer">
        They trusted me and my colleagues for our teachings
    </div>
</div>


<style>

.partners-section {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 6px 2px rgba(0, 0, 0, 0.1);
    padding: 2rem 1rem 0.5rem;
    margin-bottom: 2rem;
    position: relative;
}

.logo-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1.5rem;
    position: relative;
    padding-bottom: 1rem;
    max-width: 1200px;
    margin: 0 auto;
    overflow: hidden;
    transition-property: height;
}

.logo-item {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 120px;
    height: 80px;
    padding: 0.5rem;
}

.logo-image {
    max-height: 100%;
    max-width: 100%;
    object-fit: contain;
    transition: transform 0.3s ease;
}

.logo-item:hover .logo-image {
    transform: scale(1.1);
}

.many-other {
    font-style: italic;
    font-size: 8pt;
    display: flex;
    justify-items: center;
    align-items: center;
}

.blur-mask {
    position: absolute;
    left: 0;
    right: 0;
    height: 100px;
    bottom: 0;
    background: linear-gradient(
        to bottom,
        rgba(255, 255, 255, 0.1) 0%,
        rgba(255, 255, 255, 0.9) 50%,
        rgba(255, 255, 255, 1) 100%
    );
    z-index: 10;
    display: flex;
    align-items: flex-end;
    justify-content: center;
    padding-bottom: 15px;
    pointer-events: none;
}

.toggle-button {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 30px;
    padding: 0.5rem 1.5rem;
    margin: 0.5rem auto 1rem;

    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    z-index: 20;
    transition: all 0.3s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    pointer-events: auto;
    font-size: 0.9rem;
    font-weight: 500;
}

.toggle-button:hover {
    background-color: #f1f3f5;
    box-shadow: 0 3px 8px rgba(0,0,0,0.15);
}

.toggle-button svg {
    width: 20px;
    height: 20px;
    fill: none;
    stroke: black;
    stroke-width: 2;
    stroke-linecap: round;
}

.button-text {
    font-size: 0.9rem;
    font-weight: 500;
}

.partners-footer {
    font-style: italic;
    font-size: 8pt;
    text-align: center;
    padding-top: 0.5rem;
    margin-top: 0.5rem;
}

@media (max-width: 768px) {
    .logo-item {
        width: 100px;
        height: 70px;
    }
    
    .logo-container {
        gap: 1rem;
    }
}

@media (max-width: 480px) {
    .logo-item {
        width: 80px;
        height: 60px;
    }
    
    .button-text {
        font-size: 0.8rem;
    }
}

@media (prefers-reduced-motion) {
    .logo-container {
        transition: none;
    }
    
    .logo-image, .toggle-button {
        transition: none;
    }
}
</style>
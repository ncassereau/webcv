<script lang="ts">

import { fade } from "svelte/transition";
import { cubicOut } from "svelte/easing";
import { Tween } from "svelte/motion";

import SeeMoreButton from "$lib/utils/SeeMoreButton.svelte";

let logos = [
    { url: '/Partners/nvidia.svg', alt: 'NVIDIA' },
    { url: '/Partners/rte.svg', alt: 'RTE' },
    { url: '/Partners/thales.svg', alt: 'Thales' },
    { url: '/Partners/idemia.svg', alt: 'IDEMIA' },
    { url: '/Partners/guerbet.webp', alt: 'Guerbet' },
    { url: '/Partners/cea.svg', alt: 'CEA' },
    { url: '/Partners/ministere.svg', alt: 'Ministères des finances / de la justice / de la transition écologique / de l\'intérieur' },
    { url: '/Partners/edf.svg', alt: 'EDF' },
    { url: '/Partners/meteofrance.svg', alt: 'MétéoFrance' },
    { url: '/Partners/francetravail.svg', alt: 'France Travail' },
    { url: '/Partners/cnrs.svg', alt: 'CNRS' },
    { url: '/Partners/centralesupelec.svg', alt: 'CentraleSupélec' },
    { url: '/Partners/collegedefrance.webp', alt: 'Collège de France' },
    { url: '/Partners/ens.webp', alt: 'ENS Paris Saclay' },
    { url: '/Partners/engie.svg', alt: 'ENGIE' },
    { url: '/Partners/inria.svg', alt: 'INRIA' },
    { url: '/Partners/inserm.svg', alt: 'INSERM' },
    { url: '/Partners/onera.svg', alt: 'ONERA' },
    { url: '/Partners/pasteur.svg', alt: 'Institut Pasteur' },
    { url: '/Partners/polytechnique.webp', alt: 'École Polytechnique' },
    { url: '/Partners/sorbonne.svg', alt: 'Sorbonne Université' },
    { url: '/Partners/synchrotron.webp', alt: 'Synchrotron Soleil' },
];

let expanded = $state(false);

let containerHeight = new Tween(100, { duration: 600, easing: cubicOut });
let logoContainer: HTMLElement;

function updateContainerSize() {
    containerHeight.target = expanded ? logoContainer.scrollHeight : 100;
}

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
                    title={logo.alt}
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
    
    <SeeMoreButton
        enlargeText="See all those who trusted me and my colleagues for our teachings"
        onclick={updateContainerSize}
        bind:expanded
    />
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

.logo-item .logo-image:hover {
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
}

@media (prefers-reduced-motion) {
    .logo-container {
        transition: none;
    }
    
    .logo-image {
        transition: none;
    }
}
</style>
<script lang="ts">

let logos = [
    { url: 'https://svelte.dev/favicon.png', alt: 'Svelte' },
    { url: '/api/placeholder/100/50', alt: 'Logo 2' },
    { url: '/api/placeholder/100/50', alt: 'Logo 3' },
    { url: '/api/placeholder/100/50', alt: 'Logo 4' },
    { url: '/api/placeholder/100/50', alt: 'Logo 5' },
    { url: '/api/placeholder/100/50', alt: 'Logo 6' }
];
let animationDuration = 10;
let pauseOnHover = true;

let hoverringBanner: boolean = $state(false);

let animationPlayState: string = $derived(pauseOnHover && hoverringBanner ? "paused" : "running");

</script>


<h1>
    <svg
        viewBox="0 0 24 24"
        xmlns="http://www.w3.org/2000/svg"
    >
        <path d="M9 2H5v4h4V2zm7 7V7H2v9h2v6h2v-6h2v6h2V9h6zm-5-7h11v14H11v-2h9V4h-9V2z" />
    </svg>
    Teachings
</h1>


During my experience at IDRIS, one of my task was to provide teaching courses
to universities, other institutes, and even private companies. Here are the four
main courses I gave with my fellow ML Engineers at IDRIS.

<ul>
    <a
        href="https://cnrsformation.cnrs.fr/introduction-pratique-au-deep-learning?mc=Deep%20Learning%20-"
        target="_blank" rel="noopener noreferrer">
        <li>
            Introduction pratique au Deep Learning
        </li>
    </a>
    <a
        href="https://cnrsformation.cnrs.fr/architectures-du-deep-learning?mc=Deep%20Learning%20-"
        target="_blank" rel="noopener noreferrer">
        <li>
            Architectures du Deep Learning
        </li>
    </a>
    <a
        href="https://cnrsformation.cnrs.fr/deep-learning-optimise-sur-supercalculateur?mc=Deep%20Learning%20-"
        target="_blank" rel="noopener noreferrer">
        <li>
            Deep Learning optimisé sur supercalculateur
        </li>
    </a>
    <a
        href="javascript:void(0)"
        target="_blank" rel="noopener noreferrer">
        <li>
            Spécialisation des grands modèles de langue: Prompt Engineering & Fine-tuning
        </li>
    </a>
</ul>


<div 
    class="logo-banner"
    role="none"
    onmouseenter={() => hoverringBanner = true}
    onmouseleave={() => hoverringBanner = false}
>
    <div
        class="logo-banner-inner"
        style:animation-duration="{animationDuration}s"
        style:animation-play-state={animationPlayState}
    >
        {#each [...logos, ...logos] as logo, i}
            <div class="logo-item">
                <img src={logo.url} alt={logo.alt} />
            </div>
        {/each}
    </div>
</div>


Lorem ipsum dolor si amet


<style>

.logo-banner {
    width: 100%;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    background-color: #f8f9fa;
    padding: 1rem;
}

.logo-banner-inner {
    display: flex;
    animation: scroll linear infinite;
    width: max-content;
}

.logo-item {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 2rem;
}

.logo-item img {
    height: 50px;
    object-fit: contain;
}

@keyframes scroll {
    0% {
        transform: translateX(0);
    }
    100% {
        transform: translateX(-50%);
    }
}

ul {
    list-style: none;
    padding: 0;
    margin: 20px 0;
    font-family: 'Arial', sans-serif;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f5f5f5;
}

li {
    position: relative;
    padding: 10px 15px 10px 40px;
    margin-bottom: 10px;
    border-radius: 5px;
    transition: all 0.3s ease;
}

li::before {
    content: "";
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    width: 12px;
    height: 12px;
    background: linear-gradient(135deg, #4e89ae, #43cea2);
    border-radius: 50%;
    box-shadow: 0 0 0 3px rgba(78, 137, 174, 0.2);
}

li:hover {
    background-color: #e8f4f8;
    transform: translateX(5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

a {
    text-decoration: none;
    color: inherit;
}

</style>
<script lang="ts">
    
import Braintale from './Braintale.svelte';
import IDRIS from './IDRIS.svelte';
import Picomto from './Picomto.svelte';
import ThalesServices from './ThalesServices.svelte';

const experiences = [IDRIS, Picomto, Braintale, ThalesServices]

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


<div class="all-experiences">
    
    {#each experiences as Experience, index}
        <Experience />
        {#if index < experiences.length - 1}
            <hr />
        {/if}
    {/each}

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



hr {
    height: 12px;
    width: 85%;
    border: none;
    position: relative;
    margin: 1rem auto;
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
    transform: translateX(-50%) scale(2);
    background-color: white;
    padding: 0 15px;
    color: #555;
    font-size: 12px;
    line-height: 12px;
}

</style>

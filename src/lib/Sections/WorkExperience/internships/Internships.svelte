<script lang="ts">
	import { slide } from 'svelte/transition';

	import Braintale from './Braintale.svelte';
	import Picomto from './Picomto.svelte';
	import ThalesServices from './ThalesServices.svelte';
	import SeeMoreButton from '$lib/utils/SeeMoreButton.svelte';

	let expanded: boolean = $state(false);
</script>

<div class="internships-group">
	<div class="internships-group-header">
		Internships
		<SeeMoreButton collapseText="See less" enlargeText="See more" bind:expanded centered={false} />
	</div>
	{#if expanded}
		<div class="internships-list" transition:slide={{ duration: 300 }}>
			<Picomto />
			<hr />
			<Braintale />
			<hr />
			<ThalesServices />
		</div>
	{/if}
</div>

<style>
	.internships-group-header {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		font-weight: 600;
		font-size: clamp(1.1rem, 1rem + 0.5vw, 1.25rem);
		margin: 0;
		color: var(--title-color, #333);
	}

	.internships-list {
		padding: var(--spacing-xs) var(--spacing-xl);
	}
</style>

<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<div class="subsection-container">
	{@render children()}
</div>

<style>
	.subsection-container {
		padding: var(--spacing-lg);
	}

	.subsection-container :global(h1) {
		color: grey;
		font-weight: 700;
		font-size: 24pt;
		display: flex;
		flex-direction: row;
		gap: 0.5rem;
		align-items: center;
	}

	.subsection-container :global(h1 svg) {
		fill: var(--title-color);
		width: 40px;
		height: 40px;
	}

	.subsection-container :global(a) {
		display: inline-block;
		color: #4e89ae;
		text-decoration: none;
		font-weight: 500;
		transition: color 0.2s ease;
	}

	.subsection-container :global(a:hover) {
		color: #43cea2;
		text-decoration: underline;
	}
</style>

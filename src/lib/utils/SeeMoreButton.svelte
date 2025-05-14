<script lang="ts">
	let {
		expanded = $bindable(false),
		collapseText = 'Collapse',
		enlargeText = 'See more',
		centered = true,
		onclick = () => {}
	}: {
		expanded?: boolean;
		collapseText?: string;
		enlargeText?: string;
		centered?: boolean;
		onclick?: () => void;
	} = $props();

	function onbuttonclick() {
		expanded = !expanded;
		onclick();
	}
</script>

<div class="button-container" class:centered>
	<button class="toggle-button" onclick={onbuttonclick} aria-expanded={expanded}>
		<span class="button-text">{expanded ? collapseText : enlargeText}</span>
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
			{#if expanded}
				<path d="m18 15-6-6-6 6" />
			{:else}
				<path d="M12 5v14M5 12h14" />
			{/if}
		</svg>
	</button>
</div>

<style>
	.button-container.centered {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.toggle-button {
		background-color: #f8f9fa;
		border: 1px solid #e9ecef;
		border-radius: 30px;
		padding: 0.4rem 1.2rem;
		display: inline-flex;
		width: fit-content;
		align-items: center;
		gap: 0.5rem;
		cursor: pointer;
		z-index: 2;
		transition: all 0.2s ease;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.08);
		font-size: 0.9rem;
		font-weight: 500;
		color: #495057;
	}

	.centered .toggle-button {
		margin: 0.5rem auto;
	}

	.toggle-button:hover {
		background-color: #e9ecef;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.12);
	}

	.toggle-button:focus {
		outline: none;
		box-shadow: 0 0 0 2px rgba(66, 153, 225, 0.5);
	}

	.toggle-button svg {
		width: 18px;
		height: 18px;
		fill: none;
		stroke: currentColor;
		stroke-width: 2;
		stroke-linecap: round;
		stroke-linejoin: round;
		transition: transform 0.2s ease;
	}

	.button-text {
		font-size: 0.85rem;
		font-weight: 500;
	}

	@media (prefers-reduced-motion) {
		.toggle-button {
			transition: none;
		}

		.toggle-button svg {
			transition: none;
		}
	}
</style>

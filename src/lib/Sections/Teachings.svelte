<script lang="ts">
	import { slide } from 'svelte/transition';

	import PartnersBanner from '$lib/Sections/PartnersBanner.svelte';

	let expandedItems = $state(new Set());

	function toggleItem(id: string) {
		if (expandedItems.has(id)) {
			expandedItems.delete(id);
		} else {
			expandedItems.add(id);
		}
		expandedItems = new Set(expandedItems);
	}
</script>

<h1>
	<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
		<path d="M9 2H5v4h4V2zm7 7V7H2v9h2v6h2v-6h2v6h2V9h6zm-5-7h11v14H11v-2h9V4h-9V2z" />
	</svg>
	Teachings
</h1>

<p>
	During my experience at IDRIS, one of my task was to provide teaching courses to universities,
	other institutes, and even private companies. Here is an overview of teachings I did during my
	time at IDRIS.
</p>

<ul class="teachings-list">
	<li>
		<div
			class="teaching-title"
			role="button"
			tabindex="0"
			class:active={expandedItems.has('spellm')}
			onclick={() => toggleItem('spellm')}
			onkeydown={(ev) => ev.key === 'Enter' && toggleItem('spellm')}
		>
			Specialization of Large Language Models: Prompt Engineering & Fine-tuning (Manager of this
			course)
		</div>
		{#if expandedItems.has('spellm')}
			<div class="teaching-description" transition:slide={{ duration: 300 }}>
				This advanced course focuses on strategies to adapt language models to specific datasets or
				use-cases. We cover various methods from both prompt engineering and fine-tuning
				perspectives.

				<div class="course-highlight">
					<h4>Key concepts</h4>
					<ul>
						<li>
							Fine-tuning of different transformer architectures (encoder vs decoder vs
							encoder-decoder)
						</li>
						<li>Parameter-Efficient Fine-Tuning methods</li>
						<li>Data cleaning</li>
						<li>Evaluation & metrics for large language models</li>
						<li>Preference alignment (RLHF, DPO, KTO & GRPO)</li>
						<li>Inference optimization</li>
					</ul>
				</div>

				<a
					href="https://cnrsformation.cnrs.fr/specialisation-des-llm-fine-tuning-et-prompt-engineering"
					target="_blank"
					rel="noopener noreferrer"
					class="course-link"
				>
					See course →
				</a>
			</div>
		{/if}
	</li>

	<li>
		<div
			class="teaching-title"
			role="button"
			tabindex="0"
			class:active={expandedItems.has('dlojz')}
			onclick={() => toggleItem('dlojz')}
			onkeydown={(ev) => ev.key === 'Enter' && toggleItem('dlojz')}
		>
			Optimization of Deep Learning for Supercomputers
		</div>
		{#if expandedItems.has('dlojz')}
			<div class="teaching-description" transition:slide={{ duration: 300 }}>
				This advanced course focuses on strategies to apply deep learning methods on supercomputers.
				This is useful for researchers and engineers who want to use a large number of GPUs and work
				with sizable datasets.

				<div class="performance-stats">
					<div class="stat-item">
						<span class="stat-value">100×</span>
						<span class="stat-label">Potential speed-up compared to unoptimized setup</span>
					</div>
					<div class="stat-item">
						<span class="stat-value">TB</span>
						<span class="stat-label">Scale of data</span>
					</div>
				</div>

				<div class="course-highlight">
					<h4>Key concepts</h4>
					<ul>
						<li>GPU computing with Mixed Precision</li>
						<li>Easy distribution with Data Parallelism</li>
						<li>DataLoader optimizations</li>
						<li>Shorter training with better optimizers, learning-rate schedulers, etc.</li>
						<li>Advanced Parallelism methods (FSDP, Pipeline, Tensor & Context Parallelism)</li>
					</ul>
				</div>

				<a
					href="https://cnrsformation.cnrs.fr/deep-learning-optimise-sur-supercalculateur"
					target="_blank"
					rel="noopener noreferrer"
					class="course-link"
				>
					See course →
				</a>
			</div>
		{/if}
	</li>

	<li>
		<div
			class="teaching-title"
			role="button"
			tabindex="0"
			class:active={expandedItems.has('idris')}
			onclick={() => toggleItem('idris')}
			onkeydown={(ev) => ev.key === 'Enter' && toggleItem('idris')}
		>
			Other IDRIS formal courses
		</div>
		{#if expandedItems.has('idris')}
			<div class="teaching-description" transition:slide={{ duration: 300 }}>
				<h2>Hands-on Introduction to Deep Learning</h2>
				This course aims to provide attendees with the basics of Deep Learning.

				<div class="course-highlight">
					<h4>Key concepts</h4>
					<ul>
						<li>Basics of Neural Networks and numerical optimization</li>
						<li>How to use PyTorch</li>
						<li>Practical applications</li>
					</ul>
				</div>

				<a
					href="https://cnrsformation.cnrs.fr/introduction-pratique-au-deep-learning"
					target="_blank"
					rel="noopener noreferrer"
					class="course-link"
				>
					See course →
				</a>

				<h2>Architecture of Deep Learning</h2>
				This course gives an overview of multiple common Deep Learning architectures, as well as their
				respective purposes, strengths, and weaknesses.

				<div class="course-highlight">
					<h4>Key concepts</h4>
					<ul>
						<li>Convolutional Neural Networks</li>
						<li>Graph Neural Networks</li>
						<li>Diffusion Models</li>
						<li>Recurrent Neural Networks and more importantly Transformers</li>
					</ul>
				</div>

				<a
					href="https://cnrsformation.cnrs.fr/architectures-du-deep-learning"
					target="_blank"
					rel="noopener noreferrer"
					class="course-link"
				>
					See course →
				</a>
			</div>
		{/if}
	</li>

	<li>
		<div
			class="teaching-title"
			role="button"
			tabindex="0"
			class:active={expandedItems.has('misc')}
			onclick={() => toggleItem('misc')}
			onkeydown={(ev) => ev.key === 'Enter' && toggleItem('misc')}
		>
			Miscellaneous
		</div>
		{#if expandedItems.has('misc')}
			<div class="teaching-description" transition:slide={{ duration: 300 }}>
				<ul>
					<li>
						Fidle (<a
							href="https://fidle.cnrs.fr/"
							target="_blank"
							rel="noopener noreferrer"
							class="course-link"
						>
							See course website
						</a>)
					</li>
					<li>Workshop JSALT</li>
					<li>NVIDIA Bootcamps & Hackathons as a mentor</li>
					<li>and many more...</li>
				</ul>
			</div>
		{/if}
	</li>
</ul>

<PartnersBanner />

<style>
	.teachings-list {
		list-style: none;
		padding: 0;
		margin: var(--spacing-lg) 0;
		box-shadow: 2px 2px 4px 2px rgba(0, 0, 0, 0.1);
		background-color: #f5f5f5;
		border-radius: 8px;
		overflow: hidden;
	}

	.teachings-list li {
		position: relative;
		margin-bottom: 1px;
		background-color: white;
	}

	.teaching-title {
		position: relative;
		padding: var(--spacing-md) var(--spacing-lg) var(--spacing-md) var(--spacing-xxl);
		cursor: pointer;
		transition: all 0.3s ease;
	}

	.teaching-title::before {
		content: '';
		position: absolute;
		left: var(--spacing-md);
		top: 50%;
		transform: translateY(-50%);
		width: 12px;
		height: 12px;
		background: linear-gradient(135deg, #4e89ae, #43cea2);
		border-radius: 50%;
		box-shadow: 0 0 0 3px rgba(78, 137, 174, 0.2);
		transition: transform 0.3s ease;
	}

	.teaching-title::after {
		content: '▼';
		position: absolute;
		right: var(--spacing-md);
		font-size: 12px;
		top: 50%;
		transform: translateY(-50%) rotate(-90deg);
		transition: transform 0.3s ease;
	}

	.teaching-title.active::after {
		transform: translateY(-50%);
	}

	.teaching-title:hover,
	.teaching-title.active {
		background-color: #e8f4f8;
	}

	.teaching-description {
		padding: var(--spacing-lg) var(--spacing-lg) var(--spacing-md) var(--spacing-xxl);
		background-color: #f8f9fa;
		border-top: 1px solid #eaeaea;
	}

	.teaching-description ul {
		box-shadow: none;
		background-color: transparent;
		padding-left: var(--spacing-lg);
		list-style-type: disc;
	}

	.teaching-description ul li {
		background-color: transparent;
	}

	.teaching-description h2 {
		padding: 0;
	}

	.teaching-description h2:not(:first-child) {
		margin-top: 2rem;
	}

	.performance-stats {
		display: flex;
		justify-content: space-around;
		margin: var(--spacing-lg) 0;
		text-align: center;
	}

	.stat-item {
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.stat-value {
		font-size: 2rem;
		font-weight: bold;
		color: #4e89ae;
	}

	.stat-label {
		font-size: 0.8rem;
		color: #666;
	}

	.course-highlight {
		background-color: #f0f7fa;
		padding: var(--spacing-xs) var(--spacing-lg);
		border-left: 3px solid #4e89ae;
		margin: var(--spacing-lg) 0;
	}

	.course-highlight h4 {
		margin-top: 0;
		color: #4e89ae;
	}
</style>

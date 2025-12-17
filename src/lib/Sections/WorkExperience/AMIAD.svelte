<script lang="ts">
	import WorkExperienceItem from './WorkExperienceItem.svelte';
</script>

<WorkExperienceItem
	jobTitle="Senior HPC AI Engineer"
	employer="AMIAD"
	start="October 2025"
	current={true}
>
	Optimizing AI workloads using High-Performance Computing techniques on cutting-edge
	infrastructure, delivering substantial performance improvements and supporting researchers on
	next-generation computing systems.

	<div class="project-highlight">
		<h4>Kernel Optimization Projects</h4>

		<p>
			<strong>Second-order optimizer optimization:</strong> Developed a custom Triton kernel achieving
			7x speedup and 5x memory reduction compared to base PyTorch implementation.
		</p>

		<div class="performance-stats">
			<div class="stat-item">
				<span class="stat-value">7×</span>
				<span class="stat-label">Speedup</span>
			</div>
			<div class="stat-item">
				<span class="stat-value">5×</span>
				<span class="stat-label">Memory reduction</span>
			</div>
		</div>

		<p>
			<strong>Custom CUDA kernel:</strong> Hand-optimized CUDA implementation delivering 33% performance
			improvement over JAX/XLA compiler.
		</p>

		<div class="performance-stats">
			<div class="stat-item">
				<span class="stat-value">+33%</span>
				<span class="stat-label">Faster than JAX/XLA</span>
			</div>
		</div>
	</div>

	<ul style="margin-top: 1rem;">
		<li>
			<strong>HPC Infrastructure Support:</strong> Supporting researchers in using the newly acquired
			NVIDIA GB200 NVL72 supercomputer through infrastructure setup (Spack installation, package management)
			and development of Slurm job scheduling scripts.
		</li>
		<li>
			<strong>Infrastructure Deployment:</strong> Infrastructure deployment and automation using Docker,
			Ansible, and OpenStack for research computing environments.
		</li>
	</ul>
</WorkExperienceItem>

<style>
	.project-highlight {
		background-color: #f0f7fa;
		padding: var(--spacing-md) var(--spacing-lg);
		border-left: 3px solid #4e89ae;
		margin: var(--spacing-md) 0;
	}

	.project-highlight h4 {
		margin-top: 0;
		margin-bottom: var(--spacing-md);
		color: #4e89ae;
	}

	.project-highlight p {
		margin: var(--spacing-sm) 0;
	}

	.performance-stats {
		display: flex;
		justify-content: space-around;
		margin: var(--spacing-md) 0;
		text-align: center;
		gap: var(--spacing-lg);
	}

	.stat-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		flex: 1;
	}

	.stat-value {
		font-size: 2rem;
		font-weight: bold;
		color: #4e89ae;
		line-height: 1;
	}

	.stat-label {
		font-size: 0.8rem;
		color: #666;
		margin-top: var(--spacing-xs);
	}
</style>

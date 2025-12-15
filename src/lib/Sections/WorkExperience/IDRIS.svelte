<script lang="ts">
	import WorkExperienceItem from './WorkExperienceItem.svelte';
</script>

<WorkExperienceItem
	jobTitle="Artificial Intelligence Engineer"
	employer="IDRIS (CNRS)"
	start="May 2021"
	end="May 2025"
>
	Led critical AI infrastructure support on France's national supercomputing platform, delivering
	both daily technical expertise to researchers and long-term engineering collaboration on
	cutting-edge AI research projects across multiple scientific domains.

	<ul style="margin-bottom: 0;">
		<li>
			<strong>AI Support Team Engineer at IDRIS:</strong>
			<ul>
				<li>Helped researchers (>2000) use the <strong>Jean Zay</strong> national Supercomputer</li>
				<li>
					Developed tools to help manage and use the Supercomputer (distributed environment
					initialization, conda environment protection)
				</li>
				<li>
					Benchmarked new hardware accelerators (NVIDIA GPUs, AMD GPUs, GraphCore IPU) and libraries
				</li>
				<li>Technological watch in Deep Learning, particularly Natural Language Processing</li>
			</ul>
		</li>
		<li>
			<strong>Research Collaboration (PNRIA Network):</strong> Helped researchers in multiple
			research projects:
			<ul>
				<li>
					<strong>POT</strong> (<a href="https://github.com/PythonOT/POT"
						>https://github.com/PythonOT/POT</a
					>): Multiple backends for optimal transport algorithms
				</li>
				<li>
					<strong>Earth Systems Modeling</strong> (Pierre-Simon Laplace Institute): AI for quickstarting
					NeMO simulations
				</li>
				<li>
					<strong>Spectroscopy</strong> (CREATIS): Diffusion Models to generate brain spectroscopy samples
				</li>
				<li>
					<strong>AION</strong> (Flatiron Institute): Foundational Model for Astrophysics based on multimodal
					masked modeling
				</li>
				<li><strong>AutoSynth</strong> (LaBRI): Code generation with LLM</li>
			</ul>
		</li>
		<li>
			<strong>Teaching in Artificial Intelligence.</strong> More than 1000 researchers / PhD formed.
			More on teaching
			<a target="_self" href="#teachings">here</a>.
		</li>
	</ul>
</WorkExperienceItem>

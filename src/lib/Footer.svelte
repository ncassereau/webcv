<script lang="ts">
	const annee = new Date().getFullYear();
	const repoUrl = 'https://github.com/ncassereau/webcv';
</script>

<footer>
	<div class="footer-container">
		<div class="github-link">
			<a href={repoUrl} target="_blank" rel="noopener noreferrer" aria-label="GitHub repository">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 98 96">
					<path
						fill-rule="evenodd"
						clip-rule="evenodd"
						d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"
					/>
				</svg>
				<span>Source code on GitHub</span>
			</a>
		</div>

		<div class="footer-copyright">
			<p>&copy; {annee} Nathan Cassereau. All rights reserved</p>
			<p class="last-update">Last updated: June 2025</p>
		</div>
	</div>
</footer>

<style>
	footer {
		padding: var(--spacing-lg) 0;
		font-size: 14px;
		margin-top: auto;
		background-color: #333;
		color: #fff;
	}

	.footer-container {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.github-link {
		margin-bottom: 10px;
	}

	.github-link a {
		display: flex;
		align-items: center;
		gap: 8px;
		color: inherit;
		text-decoration: none;
		transition:
			color 0.3s,
			transform 0.2s;
		font-size: 15px;
	}

	.github-link a:hover {
		color: #4dabf7;
		transform: translateY(-1px);
	}

	.github-link svg {
		font-size: 18px;
		width: 2rem;
		height: 2rem;
		fill: #fff;
		transition: fill 0.3s;
	}

	.github-link a:hover svg {
		fill: #4dabf7;
	}

	.footer-copyright {
		width: 100%;
		text-align: center;
		color: #aaa;
	}

	.footer-copyright p {
		margin: 5px 0;
	}

	.last-update {
		font-size: 12px;
		opacity: 0.7;
	}

	@media (max-width: 768px) {
		.github-link {
			text-align: center;
		}
	}
</style>

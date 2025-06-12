<script lang="ts"></script>

<h1>
	<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="172.4 311.5 777.2 499">
		<path d="M935.1 585.9V445.6l-21.5 7.3v133z" />
		<path
			d="m806.2 529-240 81.5a21 21 0 0 1-13.7 0l-240-81.4v201.3h.2l-.5 2.7c0 24 110.7 77.4 247 77.4S806 757.1 806 733.1l-.5-2.7h.8V529z"
		/>
		<path
			d="M312.5 489.3 559.4 573l246.8-83.7 107.4-36.4 21.5-7.3 11.2-3.8-386.9-130.3-387 130.3z"
		/>
		<path
			d="M899 618.8v82a25.3 25.3 0 1 0 50.6 0v-82c0-7-2.7-13.2-7.2-17.8h-36a25.2 25.2 0 0 0-7.4 17.8z"
		/>
		<path d="M903.1 585.9V601h42.5v-15.1h-32z" />
	</svg>
	Education
</h1>

{#snippet svgCalendar()}
	<svg
		class="calendar-svg"
		version="1.0"
		xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		viewBox="0 0 64 64"
		xml:space="preserve"
	>
		<path
			d="M60,4h-7V3c0-1.657-1.343-3-3-3s-3,1.343-3,3v1H17V3c0-1.657-1.343-3-3-3s-3,1.343-3,3v1H4 C1.789,4,0,5.789,0,8v52c0,2.211,1.789,4,4,4h56c2.211,0,4-1.789,4-4V8C64,5.789,62.211,4,60,4z M18,53c0,0.553-0.447,1-1,1h-6 c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M18,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5 c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M18,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6 c0.553,0,1,0.447,1,1V31z M30,53c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M30,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M30,31 c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V31z M42,53c0,0.553-0.447,1-1,1h-6 c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V53z M42,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5 c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M42,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6 c0.553,0,1,0.447,1,1V31z M54,42c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V42z M54,31c0,0.553-0.447,1-1,1h-6c-0.553,0-1-0.447-1-1v-5c0-0.553,0.447-1,1-1h6c0.553,0,1,0.447,1,1V31z M62,15H2V8 c0-1.104,0.896-2,2-2h7v4c0,1.657,1.343,3,3,3s3-1.343,3-3V6h30v4c0,1.657,1.343,3,3,3s3-1.343,3-3V6h7c1.104,0,2,0.896,2,2V15z"
		/>
	</svg>
{/snippet}

{#snippet educationItem(title: string, school: string, dates: string, location: string)}
	<div class="education-item">
		<div class="main-line">
			<h3 class="title">{title}</h3>
			<div class="education-time">
				{@render svgCalendar()}
				<span class="education-dates">{dates}</span>
			</div>
		</div>
		<div class="secondary-line">
			<span class="school">{school}</span>, {location}
		</div>
	</div>
{/snippet}

<div class="education-container">
	{@render educationItem(
		'MSc. Artificial Intelligence & Deep Learning with Honours',
		'Imperial College London',
		'2019 - 2020',
		'London (United Kingdom)'
	)}
	{@render educationItem(
		'Master in Engineering',
		'CentraleSupélec',
		'2017 - 2020',
		'Gif-sur-Yvette (France)'
	)}
	{@render educationItem(
		'Two-year undergraduate intensive course in maths & physics to prepare for nationwide competitive examination',
		'Lycée Michelet',
		'2015 - 2017',
		'Vanves (France)'
	)}
	{@render educationItem(
		'High-School Diploma in Science with Highest Honours',
		'Lycée Jacques Monod',
		'2017',
		'Clamart (France)'
	)}
</div>

<style>
	.education-container {
		display: flex;
		flex-direction: column;
		margin: 0 2rem;
	}

	.education-item {
		display: flex;
		flex-direction: column;
		gap: 0.25rem;
		padding: 1rem;
		border-radius: 8px;
		transition:
			box-shadow 0.3s ease,
			transform 0.2s ease;
	}

	.education-item:hover {
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
		transform: translateY(-2px);
	}

	.main-line {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		gap: 20px;
	}

	.title {
		font-weight: 600;
		font-size: clamp(1.1rem, 1rem + 0.5vw, 1.25rem);
		margin: 0;
		color: var(--title-color, #333);
	}

	.school {
		font-style: italic;
		font-weight: bold;
	}

	.education-time {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		min-width: 110px;
	}

	.calendar-svg {
		fill: var(--title-color, #666);
		width: 18px;
		height: 18px;
		flex-shrink: 0;
	}

	.education-dates {
		font-style: italic;
		color: var(--title-color, #666);
		font-size: 0.95rem;
	}

	@media (max-width: 640px) {
		.main-line {
			flex-wrap: wrap;
		}
	}
</style>

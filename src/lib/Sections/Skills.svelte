<script lang="ts">
</script>

<div class="skills-container">
    

    <h1 class="section-title">
        <svg
            class="gear-svg"
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 24 24">
            <path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.09.63-.09.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/>
        </svg>

        Skills & Expertise
    </h1>

    <div class="skills-grid">
        <div class="skills-group">
            <div class="group-title">Languages</div>
            <div class="language-tags">
                <div class="language-tag">
                    <span>French</span>
                    <span class="language-level">Native</span>
                </div>
                <div class="language-tag">
                    <span>English</span>
                    <span class="language-level">Professional</span>
                </div>
            </div>
        </div>
        
        <div class="skills-group">
            <div class="group-title">Core AI & ML</div>
            <div class="tags-container">
                <span class="skill-tag">Deep Learning</span>
                <span class="skill-tag">NLP & LLM</span>
                <span class="skill-tag">Diffusion Models</span>
                <span class="skill-tag">Computer Vision</span>
                <span class="skill-tag">Model Alignment</span>
                <span class="skill-tag">Multi-modal AI</span>
            </div>
        </div>
        
        <!-- Technology Stack -->
        <div class="skills-group">
            <div class="group-title">Technology Stack</div>
            <div class="tags-container">
                <span class="skill-tag">PyTorch</span>
                <span class="skill-tag">DeepSpeed</span>
                <span class="skill-tag">Transformers</span>
                <span class="skill-tag">Accelerate</span>
                <span class="skill-tag">LangChain</span>
                <span class="skill-tag">vLLM</span>
                <span class="skill-tag">Horovod</span>
            </div>
        </div>
        
        <!-- Infrastructure & Tools -->
        <div class="skills-group">
            <div class="group-title">Infrastructure & Tools</div>
            <div class="tags-container">
                <span class="skill-tag">Git</span>
                <span class="skill-tag">CI/CD</span>
                <span class="skill-tag">LaTeX</span>
                <span class="skill-tag">MPI</span>
                <span class="skill-tag">OpenMP</span>
                <span class="skill-tag">Slurm</span>
                <span class="skill-tag">Docker</span>
                <span class="skill-tag">Proxmox</span>
            </div>
        </div>
    </div>
</div>


<style>

.skills-container {
    width: 100%;
    --primary-color: #4a6fa5;
    --primary-light: #e0e8f5;
    --primary-dark: #2c4567;
    --neutral-light: #f5f5f5;
    --neutral-medium: #e0e0e0;
    --text-dark: #333;
    --text-medium: #555;
}

.section-title {
    text-align: center;
    margin-bottom: 1.5rem;
}

.gear-svg{
    width: 24px;
    height: 24px;
    fill: var(--title-color);
    stroke-linecap: round;
    stroke-linejoin: round;
    color: var(--title-color);
}

.skills-grid {
    display: flex;
    flex-direction: column;
    gap: 2rem;
    width: 100%;
    margin-bottom: 1rem;
}

.skills-group {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.group-title {
    font-weight: 600;
    font-size: 1.35rem;
    color: var(--text-medium);
    border-bottom: 2px solid var(--primary-color);
    padding: 0;
    margin-bottom: 0.5rem;
}

.language-tags {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

.language-tag {
    display: flex;
    background-color: var(--neutral-light);
    border-radius: 20px;
    padding: 0.5rem 1rem;
    justify-content: space-between;
    font-weight: 500;
}

.language-level {
    color: var(--primary-dark);
    font-size: 0.9rem;
    font-style: italic;
}

.tags-container {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
}

.skill-tag {
    background-color: var(--neutral-light);
    padding: 0.4rem 0.8rem;
    border-radius: 20px;
    font-size: 0.9rem;
    transition: all 0.2s ease;
}

.skill-tag:hover {
    transform: translateY(-2px);
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    background-color: var(--neutral-medium);
}

@media (max-width: 768px) {
    .skills-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }
}
</style>
<div class="thinking-dots">
    <div class="dot"></div>
    <div class="dot"></div>
    <div class="dot"></div>
</div>


<style>

.thinking-dots {
    display: inline-flex;
    align-items: center;
    width: fit-content;
}

.dot {
    width: 8px;
    height: 8px;
    background-color: #555;
    border-radius: 50%;
    margin: 0 3px;
    opacity: 0.7;
    animation: fade 1.5s infinite;
}

.dot:nth-child(2) {
    animation-delay: 0.3s;
}

.dot:nth-child(3) {
    animation-delay: 0.6s;
}

@keyframes fade {
    0%, 100% { 
        opacity: 0.4; 
        transform: scale(0.8); 
    }
    50% { 
        opacity: 1; 
        transform: scale(1.1); 
    }
}

</style>

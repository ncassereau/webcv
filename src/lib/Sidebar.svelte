<script lang="ts">

import SocialLinks from "./Social-Links.svelte";

</script>


<div class="sidebar-container">
    <div class="header">
        <picture>
            <source srcset="/moi.webp" type="image/webp">
            <img
                class="profile-img"
                src="/moi.jpg"
                alt="Nathan Cassereau"
                loading="lazy" />
        </picture>
    </div>

    <SocialLinks />


</div>


<style>

.sidebar-container {
    position: fixed;
    top: 0;
    left: 0;
    min-width: 200px;
    width: 20vw;
    height: 100vh;
    background-color: #555;
    overflow-y: auto;
    display: flex;
    flex-direction: column;
    gap: 50px;
    text-align: center;
    align-items: center;
}


.header {
    margin-top: 50px;
}


.profile-img {
    display: block;
    width: 50%;
    margin: 0 auto;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid white;
    box-shadow: 4px 4px 16px black;
}

</style>

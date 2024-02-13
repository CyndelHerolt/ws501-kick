<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header>
    <nav>
      <RouterLink to="/">
        Accueil
      </RouterLink>
    </nav>
  </header>
  <RouterView/>

  <footer>
    <small>©️ Cyndel Herolt - 2024</small>
  </footer>
</template>

<style scoped>
footer {
  position: fixed;
  bottom: 0;
  left: 0;
  background-color: var(--color-background);
  width: 100%;
  padding: 5px 10px;
}
</style>

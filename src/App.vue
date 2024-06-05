<template>
  <div id="app">
    <Navbar />
    <router-view />
  </div>
</template>

<script>
import Navbar from './components/NavbarP.vue';

export default {
  components: {
    Navbar
  }
};
</script>

<style>
@import 'bootstrap/dist/css/bootstrap.css';
@import 'assets/styles.css';

</style>

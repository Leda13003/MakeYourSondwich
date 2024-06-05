<!-- src/components/StepOptions.vue -->
<template>
  <div class="step">
    <h2>Ajout d'options supplémentaires (facultatif)</h2>
    <label v-for="option in options" :key="option">
      <input type="checkbox" :value="option" v-model="selectedOptions">
      {{ option }}
    </label>
  </div>
</template>

<script>
export default {
  name: 'StepOptions',
  data() {
    return {
      options: ['Olives', 'Jalapeños', 'Citron (pour assaisonner)'],
      selectedOptions: []
    };
  }
};
</script>

<style scoped>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
.step {
  animation: fadeIn 1s ease-in-out;
}
</style>

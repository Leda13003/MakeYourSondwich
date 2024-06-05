<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🍞 Choix de la base du pain</h2>
    <div class="form-group">
      <div 
        v-for="option in baseOptions" 
        :key="option.value" 
        :class="['option', { selected: base === option.value }]"
        @click="selectBase(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="!base">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      base: '',
      baseOptions: [
        { value: 'Tortilla de blé', label: 'Tortilla de blé', price: 1.50, emoji: '🌯' },
        { value: 'Tortilla de maïs', label: 'Tortilla de maïs', price: 1.50, emoji: '🌯' },
        { value: 'Baguette', label: 'Baguette', price: 2.00, emoji: '🥖' }
      ]
    };
  },
  methods: {
    selectBase(value) {
      this.base = value;
    },
    nextStep() {
      this.$store.commit('setBase', { base: this.base, price: this.baseOptions.find(option => option.value === this.base).price });
      this.$router.push('/protein-selection');
    }
  }
};
</script>

<style scoped>
.form-group {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.option {
  display: flex;
  align-items: center;
  gap: 10px;
  background-color: #f0f0f0;
  padding: 15px;
  border-radius: 5px;
  transition: background-color 0.3s, box-shadow 0.3s;
  cursor: pointer;
}

.option:hover {
  background-color: #e0e0e0;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.option.selected {
  background-color: #ffcc00;
  color: #fff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.text-center {
  text-align: center;
  margin-top: 30px;
}

button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}
</style>

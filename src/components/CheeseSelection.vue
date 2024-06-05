<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🧀 Ajout de fromage</h2>
    <div class="form-group">
      <div 
        v-for="option in cheeseOptions" 
        :key="option.value" 
        :class="['option', { selected: cheese === option.value }]"
        @click="selectCheese(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="!cheese">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cheese: '',
      cheeseOptions: [
        { value: 'Fromage râpé', label: 'Fromage râpé', price: 1.00, emoji: '🧀' },
        { value: 'Fromage fondu', label: 'Fromage fondu', price: 1.20, emoji: '🧀' },
        { value: 'Sauce fromagère', label: 'Sauce fromagère', price: 1.50, emoji: '🧀' }
      ]
    };
  },
  methods: {
    selectCheese(value) {
      this.cheese = value;
    },
    nextStep() {
      this.$store.commit('setCheese', { cheese: this.cheese, price: this.cheeseOptions.find(option => option.value === this.cheese).price });
      this.$router.push('/veggie-selection');
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

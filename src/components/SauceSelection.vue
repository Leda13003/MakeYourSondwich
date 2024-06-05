<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🥫 Choix des sauces</h2>
    <div class="form-group">
      <div 
        v-for="option in sauceOptions" 
        :key="option.value" 
        :class="['option', { selected: selectedSauces.includes(option.value) }]"
        @click="toggleSauce(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="selectedSauces.length === 0">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedSauces: [],
      sauceOptions: [
        { value: 'Sauce blanche', label: 'Sauce blanche', price: 0.50, emoji: '🥛' },
        { value: 'Sauce algérienne', label: 'Sauce algérienne', price: 0.50, emoji: '🌶️' },
        { value: 'Sauce samouraï', label: 'Sauce samouraï', price: 0.50, emoji: '🔥' },
        { value: 'Sauce barbecue', label: 'Sauce barbecue', price: 0.50, emoji: '🍖' },
        { value: 'Ketchup', label: 'Ketchup', price: 0.30, emoji: '🍅' },
        { value: 'Mayonnaise', label: 'Mayonnaise', price: 0.30, emoji: '🥚' },
        { value: 'Sauce harissa', label: 'Sauce harissa', price: 0.50, emoji: '🌶️' },
        { value: 'Sauce andalouse', label: 'Sauce andalouse', price: 0.50, emoji: '🍅' },
        { value: 'Sauce fromage', label: 'Sauce fromage', price: 0.50, emoji: '🧀' }
      ]
    };
  },
  methods: {
    toggleSauce(value) {
      if (this.selectedSauces.includes(value)) {
        this.selectedSauces = this.selectedSauces.filter(sauce => sauce !== value);
      } else {
        this.selectedSauces.push(value);
      }
    },
    nextStep() {
      const selectedSauceDetails = this.selectedSauces.map(sauce => {
        const sauceOption = this.sauceOptions.find(option => option.value === sauce);
        return { name: sauceOption.label, price: sauceOption.price };
      });
      this.$store.commit('setSauces', selectedSauceDetails);
      this.$router.push('/extras-selection');
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

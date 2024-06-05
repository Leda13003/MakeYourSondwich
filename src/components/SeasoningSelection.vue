<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🧂 Assaisonnement et épices</h2>
    <div class="form-group">
      <div 
        v-for="option in seasoningOptions" 
        :key="option.value" 
        :class="['option', { selected: selectedSeasonings.includes(option.value) }]"
        @click="toggleSeasoning(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="selectedSeasonings.length === 0">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedSeasonings: [],
      seasoningOptions: [
        { value: 'Sel', label: 'Sel', price: 0.10, emoji: '🧂' },
        { value: 'Poivre', label: 'Poivre', price: 0.10, emoji: '🌶️' },
        { value: 'Paprika', label: 'Paprika', price: 0.10, emoji: '🌶️' },
        { value: 'Cumin', label: 'Cumin', price: 0.10, emoji: '🌿' },
        { value: 'Coriandre', label: 'Coriandre', price: 0.10, emoji: '🌿' },
        { value: 'Ail en poudre', label: 'Ail en poudre', price: 0.10, emoji: '🧄' },
        { value: 'Oignon en poudre', label: 'Oignon en poudre', price: 0.10, emoji: '🧅' },
        { value: 'Herbes de Provence', label: 'Herbes de Provence', price: 0.10, emoji: '🌿' }
      ]
    };
  },
  methods: {
    toggleSeasoning(value) {
      if (this.selectedSeasonings.includes(value)) {
        this.selectedSeasonings = this.selectedSeasonings.filter(seasoning => seasoning !== value);
      } else {
        this.selectedSeasonings.push(value);
      }
    },
    nextStep() {
      const selectedSeasoningDetails = this.selectedSeasonings.map(seasoning => {
        const seasoningOption = this.seasoningOptions.find(option => option.value === seasoning);
        return { name: seasoningOption.label, price: seasoningOption.price };
      });
      this.$store.commit('setSeasonings', selectedSeasoningDetails);
      this.$router.push('/drink-selection');
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

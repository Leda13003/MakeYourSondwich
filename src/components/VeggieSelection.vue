<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🥗 Ajout de légumes et accompagnements</h2>
    <div class="form-group">
      <div 
        v-for="option in veggieOptions" 
        :key="option.value" 
        :class="['option', { selected: selectedVeggies.includes(option.value) }]"
        @click="toggleVeggie(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="selectedVeggies.length === 0">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedVeggies: [],
      veggieOptions: [
        { value: 'Salade verte', label: 'Salade verte', price: 0.50, emoji: '🥗' },
        { value: 'Tomates en dés', label: 'Tomates en dés', price: 0.50, emoji: '🍅' },
        { value: 'Oignons émincés', label: 'Oignons émincés', price: 0.30, emoji: '🧅' },
        { value: 'Poivrons en lamelles', label: 'Poivrons en lamelles', price: 0.40, emoji: '🌶️' },
        { value: 'Concombre en rondelles', label: 'Concombre en rondelles', price: 0.40, emoji: '🥒' },
        { value: 'Carottes râpées', label: 'Carottes râpées', price: 0.30, emoji: '🥕' },
        { value: 'Chou blanc ou rouge émincé', label: 'Chou blanc ou rouge émincé', price: 0.40, emoji: '🥬' },
        { value: 'Champignons sautés', label: 'Champignons sautés', price: 0.50, emoji: '🍄' },
        { value: 'Cornichons en rondelles', label: 'Cornichons en rondelles', price: 0.30, emoji: '🥒' }
      ]
    };
  },
  methods: {
    toggleVeggie(value) {
      if (this.selectedVeggies.includes(value)) {
        this.selectedVeggies = this.selectedVeggies.filter(veggie => veggie !== value);
      } else {
        this.selectedVeggies.push(value);
      }
    },
    nextStep() {
      const selectedVeggieDetails = this.selectedVeggies.map(veggie => {
        const veggieOption = this.veggieOptions.find(option => option.value === veggie);
        return { name: veggieOption.label, price: veggieOption.price };
      });
      this.$store.commit('setVeggies', selectedVeggieDetails);
      this.$router.push('/sauce-selection');
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

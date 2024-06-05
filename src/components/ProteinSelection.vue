<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🍖 Choix de la viande ou des protéines</h2>
    <div class="form-group">
      <div 
        v-for="option in proteinOptions" 
        :key="option.value" 
        :class="['option', { selected: selectedProteins.includes(option.value) }]"
        @click="toggleProtein(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="selectedProteins.length === 0">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedProteins: [],
      proteinOptions: [
        { value: 'Poulet grillé', label: 'Poulet grillé', price: 3.00, emoji: '🍗' },
        { value: 'Bœuf haché', label: 'Bœuf haché', price: 3.50, emoji: '🍖' },
        { value: 'Steak', label: 'Steak', price: 4.00, emoji: '🥩' },
        { value: 'Viande kebab', label: 'Viande kebab', price: 3.50, emoji: '🥙' },
        { value: 'Merguez', label: 'Merguez', price: 3.00, emoji: '🌭' },
        { value: 'Saucisses', label: 'Saucisses', price: 2.50, emoji: '🌭' },
        { value: 'Nuggets de poulet', label: 'Nuggets de poulet', price: 3.00, emoji: '🍗' },
        { value: 'Falafel', label: 'Falafel', price: 2.50, emoji: '🧆' },
        { value: 'Tofu', label: 'Tofu', price: 2.00, emoji: '🍣' }
      ]
    };
  },
  methods: {
    toggleProtein(value) {
      if (this.selectedProteins.includes(value)) {
        this.selectedProteins = this.selectedProteins.filter(protein => protein !== value);
      } else {
        this.selectedProteins.push(value);
      }
    },
    nextStep() {
      const selectedProteinDetails = this.selectedProteins.map(protein => {
        const proteinOption = this.proteinOptions.find(option => option.value === protein);
        return { name: proteinOption.label, price: proteinOption.price };
      });
      this.$store.commit('setProteins', selectedProteinDetails);
      this.$router.push('/cheese-selection');
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

<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🍟 Ajout d'autres ingrédients optionnels</h2>
    <div class="form-group">
      <div 
        v-for="option in extrasOptions" 
        :key="option.value" 
        :class="['option', { selected: selectedExtras.includes(option.value) }]"
        @click="toggleExtra(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="selectedExtras.length === 0">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedExtras: [],
      extrasOptions: [
        { value: 'Frites', label: 'Frites', price: 1.00, emoji: '🍟' },
        { value: 'Olives', label: 'Olives', price: 0.50, emoji: '🫒' },
        { value: 'Jalapeños', label: 'Jalapeños', price: 0.50, emoji: '🌶️' },
        { value: 'Citron', label: 'Citron', price: 0.30, emoji: '🍋' }
      ]
    };
  },
  methods: {
    toggleExtra(value) {
      if (this.selectedExtras.includes(value)) {
        this.selectedExtras = this.selectedExtras.filter(extra => extra !== value);
      } else {
        this.selectedExtras.push(value);
      }
    },
    nextStep() {
      const selectedExtraDetails = this.selectedExtras.map(extra => {
        const extraOption = this.extrasOptions.find(option => option.value === extra);
        return { name: extraOption.label, price: extraOption.price };
      });
      this.$store.commit('setExtras', selectedExtraDetails);
      this.$router.push('/seasoning-selection');
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

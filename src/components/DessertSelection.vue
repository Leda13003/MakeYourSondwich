<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🍰 Choix des desserts</h2>
    <div class="form-group">
      <div 
        v-for="option in dessertOptions" 
        :key="option.value" 
        :class="['option', { selected: dessert === option.value }]"
        @click="selectDessert(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="!dessert">Terminer</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dessert: '',
      dessertOptions: [
        { value: 'Brownies', label: 'Brownies', price: 2.00, emoji: '🍫' },
        { value: 'Cookies', label: 'Cookies', price: 2.00, emoji: '🍪' },
        { value: 'Muffins', label: 'Muffins', price: 2.50, emoji: '🧁' },
        { value: 'Cheesecake', label: 'Cheesecake', price: 3.00, emoji: '🍰' },
        { value: 'Tarte aux pommes', label: 'Tarte aux pommes', price: 3.00, emoji: '🍏' },
        { value: 'Gâteau au chocolat', label: 'Gâteau au chocolat', price: 3.00, emoji: '🍫' },
        { value: 'Beignets', label: 'Beignets', price: 2.00, emoji: '🍩' },
        { value: 'Éclairs', label: 'Éclairs', price: 3.00, emoji: '🍰' },
        { value: 'Tiramisu', label: 'Tiramisu', price: 3.00, emoji: '🍮' },
        { value: 'Glace', label: 'Glace', price: 2.50, emoji: '🍦' }
      ]
    };
  },
  methods: {
    selectDessert(value) {
      this.dessert = value;
    },
    nextStep() {
      this.$store.commit('setDessert', { dessert: this.dessert, price: this.dessertOptions.find(option => option.value === this.dessert).price });
      this.$router.push('/final-step');
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

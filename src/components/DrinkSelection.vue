<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🥤 Choix des boissons</h2>
    <div class="form-group">
      <div 
        v-for="option in drinkOptions" 
        :key="option.value" 
        :class="['option', { selected: drink === option.value }]"
        @click="selectDrink(option.value)"
      >
        {{ option.emoji }} {{ option.label }} - €{{ option.price.toFixed(2) }}
      </div>
    </div>
    <div class="text-center">
      <button @click="nextStep" class="btn btn-primary btn-lg" :disabled="!drink">Suivant</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      drink: '',
      drinkOptions: [
        { value: 'Coca-Cola', label: 'Coca-Cola', price: 1.50, emoji: '🥤' },
        { value: 'Pepsi', label: 'Pepsi', price: 1.50, emoji: '🥤' },
        { value: 'Sprite', label: 'Sprite', price: 1.50, emoji: '🥤' },
        { value: 'Fanta', label: 'Fanta', price: 1.50, emoji: '🥤' },
        { value: 'Dr. Pepper', label: 'Dr. Pepper', price: 1.50, emoji: '🥤' },
        { value: 'Mountain Dew', label: 'Mountain Dew', price: 1.50, emoji: '🥤' },
        { value: '7UP', label: '7UP', price: 1.50, emoji: '🥤' },
        { value: 'Ginger Ale', label: 'Ginger Ale', price: 1.50, emoji: '🥤' },
        { value: 'Root Beer', label: 'Root Beer', price: 1.50, emoji: '🥤' },
        { value: 'Orangina', label: 'Orangina', price: 1.50, emoji: '🍊' }
      ]
    };
  },
  methods: {
    selectDrink(value) {
      this.drink = value;
    },
    nextStep() {
      this.$store.commit('setDrink', { drink: this.drink, price: this.drinkOptions.find(option => option.value === this.drink).price });
      this.$router.push('/dessert-selection');
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

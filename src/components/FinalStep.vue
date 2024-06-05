<template>
  <div class="step animated fadeIn">
    <h2 class="step-title">🥪 Résumé de votre commande 🥪</h2>
    <div class="summary-grid">
      <div v-for="(sandwich, index) in sandwiches" :key="index" class="summary-sandwich">
        <h3>🥙 Sandwich {{ index + 1 }}</h3>
        <ul class="summary-list">
          <li><strong>🍞 Base:</strong> {{ sandwich.base }} - €{{ sandwich.basePrice.toFixed(2) }}</li>
          <li><strong>🍖 Protéines:</strong>
            <ul>
              <li v-for="(protein, i) in sandwich.proteins" :key="i">
                {{ protein.quantity }}x {{ protein.name }} - €{{ (protein.price * protein.quantity).toFixed(2) }}
              </li>
            </ul>
          </li>
          <li v-if="sandwich.cheese"><strong>🧀 Fromage:</strong> {{ sandwich.cheese }} - €{{ sandwich.cheesePrice.toFixed(2) }}</li>
          <li><strong>🥗 Légumes:</strong>
            <ul>
              <li v-for="(veggie, i) in sandwich.veggies" :key="i">
                {{ veggie.name }} - €{{ veggie.price.toFixed(2) }}
              </li>
            </ul>
          </li>
          <li><strong>🥫 Sauces:</strong>
            <ul>
              <li v-for="(sauce, i) in sandwich.sauces" :key="i">
                {{ sauce.name }} - €{{ sauce.price.toFixed(2) }}
              </li>
            </ul>
          </li>
          <li><strong>🍟 Extras:</strong>
            <ul>
              <li v-for="(extra, i) in sandwich.extras" :key="i">
                {{ extra.name }} - €{{ extra.price.toFixed(2) }}
              </li>
            </ul>
          </li>
          <li><strong>🧂 Assaisonnement:</strong> {{ sandwich.seasonings.map(seasoning => seasoning.name).join(', ') }}</li>
          <li v-if="sandwich.drink"><strong>🥤 Boisson:</strong> {{ sandwich.drink }} - €{{ sandwich.drinkPrice.toFixed(2) }}</li>
          <li v-if="sandwich.dessert"><strong>🍰 Dessert:</strong> {{ sandwich.dessert }} - €{{ sandwich.dessertPrice.toFixed(2) }}</li>
        </ul>
        <h4 class="total">Total: €{{ sandwich.total.toFixed(2) }}</h4>
      </div>
    </div>
    <div class="text-center mt-3">
      <button @click="addAnotherSandwich" class="btn btn-primary btn-lg">Ajouter un autre sandwich</button>
    </div>
    <div class="text-center mt-3">
      <button @click="submitOrder" class="btn btn-success btn-lg">Commander 🍽️</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapState } from 'vuex';

export default {
  computed: {
    ...mapState(['sandwiches'])
  },
  methods: {
    addAnotherSandwich() {
      this.$router.push('/base-selection');
    },
    async submitOrder() {
      try {
        const response = await axios.post('http://localhost:8000/submit_order.php', { sandwiches: this.sandwiches });
        if (response.data.success) {
          alert('Votre commande a été passée avec succès!');
          this.$store.commit('resetOrder');
          this.$router.push('/');
        } else {
          alert('Une erreur s\'est produite lors de la soumission de votre commande.');
        }
      } catch (error) {
        console.error('Erreur lors de la soumission de la commande:', error);
        alert('Une erreur s\'est produite lors de la soumission de votre commande.');
      }
    }
  }
};
</script>

<style scoped>
.step {
  background: white;
  padding: 30px;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  animation-duration: 0.5s;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  margin-bottom: 20px;
}

.step-title {
  font-size: 2rem;
  font-weight: bold;
  color: #343a40;
  margin-bottom: 20px;
}

.summary-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
  width: 100%;
}

.summary-sandwich {
  background: #f8f8f8;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.summary-list {
  list-style: none;
  padding: 0;
  margin-bottom: 10px;
}

.summary-list li {
  font-size: 1.2rem;
  margin-bottom: 10px;
}

.summary-list ul {
  list-style: none;
  padding: 0;
}

.summary-list strong {
  color: #007bff;
}

.total {
  font-size: 1.5rem;
  font-weight: bold;
  color: #ff6b6b;
}

button {
  background-color: #28a745;
  border-color: #28a745;
  padding: 15px 30px;
  font-size: 1.25rem;
  transition: background-color 0.3s, transform 0.3s;
  margin-top: 10px;
}

button:hover {
  background-color: #218838;
  transform: scale(1.05);
}
</style>

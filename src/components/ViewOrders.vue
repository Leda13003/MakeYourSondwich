<template>
    <div class="view-orders">
      <h2>Commandes en Cours</h2>
      <div v-if="orders.length === 0">Aucune commande disponible.</div>
      <div v-else>
        <div v-for="order in orders" :key="order.order_id" class="order">
          <h3>Commande #{{ order.order_id }} par {{ order.username }} le {{ formatDate(order.created_at) }}</h3>
          <div v-for="sandwich in order.sandwiches" :key="sandwich.sandwich_id" class="sandwich">
            <p><strong>Sandwich ID:</strong> {{ sandwich.sandwich_id }}</p>
            <ul>
              <li><strong>Base:</strong> {{ sandwich.base }} - €{{ parseFloat(sandwich.base_price).toFixed(2) }}</li>
              <li v-if="sandwich.cheese"><strong>Fromage:</strong> {{ sandwich.cheese }} - €{{ parseFloat(sandwich.cheese_price).toFixed(2) }}</li>
              <li v-if="sandwich.drink"><strong>Boisson:</strong> {{ sandwich.drink }} - €{{ parseFloat(sandwich.drink_price).toFixed(2) }}</li>
              <li v-if="sandwich.dessert"><strong>Dessert:</strong> {{ sandwich.dessert }} - €{{ parseFloat(sandwich.dessert_price).toFixed(2) }}</li>
              <li><strong>Total:</strong> €{{ parseFloat(sandwich.total_price).toFixed(2) }}</li>
            </ul>
          </div>
          <button @click="markAsDelivered(order.order_id)" class="btn-delivered">Délivré</button>
        </div>
      </div>
  
      <h2>Commandes Traitées</h2>
      <div v-if="processedOrders.length === 0">Aucune commande traitée disponible.</div>
      <div v-else>
        <div v-for="order in processedOrders" :key="order.order_id" class="order">
          <h3>Commande #{{ order.order_id }} par {{ order.username }} le {{ formatDate(order.created_at) }}</h3>
          <div v-for="sandwich in order.sandwiches" :key="sandwich.sandwich_id" class="sandwich">
            <p><strong>Sandwich ID:</strong> {{ sandwich.sandwich_id }}</p>
            <ul>
              <li><strong>Base:</strong> {{ sandwich.base }} - €{{ parseFloat(sandwich.base_price).toFixed(2) }}</li>
              <li v-if="sandwich.cheese"><strong>Fromage:</strong> {{ sandwich.cheese }} - €{{ parseFloat(sandwich.cheese_price).toFixed(2) }}</li>
              <li v-if="sandwich.drink"><strong>Boisson:</strong> {{ sandwich.drink }} - €{{ parseFloat(sandwich.drink_price).toFixed(2) }}</li>
              <li v-if="sandwich.dessert"><strong>Dessert:</strong> {{ sandwich.dessert }} - €{{ parseFloat(sandwich.dessert_price).toFixed(2) }}</li>
              <li><strong>Total:</strong> €{{ parseFloat(sandwich.total_price).toFixed(2) }}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        orders: [],
        processedOrders: []
      };
    },
    created() {
      this.fetchOrders();
    },
    methods: {
      async fetchOrders() {
        try {
          const response = await axios.get('http://localhost:8000/getorder.php');
          if (response.data.success) {
            this.orders = response.data.orders;
          } else {
            alert('Erreur lors de la récupération des commandes.');
          }
        } catch (error) {
          console.error('Erreur lors de la récupération des commandes:', error);
          alert('Erreur lors de la récupération des commandes.');
        }
      },
      async markAsDelivered(orderId) {
        try {
          console.log(`Marking order ${orderId} as delivered`);
          const response = await axios.post('http://localhost:8000/delete_order.php', { order_id: orderId });
          console.log('Response from server:', response.data);
          if (response.data.success) {
            // Déplacer la commande vers les commandes traitées
            const deliveredOrder = this.orders.find(order => order.order_id === orderId);
            this.processedOrders.push(deliveredOrder);
            // Retirer la commande des commandes en cours
            this.orders = this.orders.filter(order => order.order_id !== orderId);
            alert('Commande marquée comme délivrée.');
          } else {
            alert(`Erreur lors de la suppression de la commande: ${response.data.message}`);
          }
        } catch (error) {
          console.error('Erreur lors de la suppression de la commande:', error);
          alert('Erreur lors de la suppression de la commande.');
        }
      },
      formatDate(dateString) {
        const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
        return new Date(dateString).toLocaleDateString('fr-FR', options);
      }
    }
  };
  </script>
  
  <style scoped>
  .view-orders {
    padding: 20px;
  }
  
  .order {
    background: #f8f8f8;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .sandwich {
    margin-top: 10px;
    padding-left: 20px;
    border-left: 2px solid #007bff;
  }
  
  h2 {
    text-align: center;
    margin-bottom: 20px;
  }
  
  h3 {
    color: #007bff;
  }
  
  .btn-delivered {
    background-color: #28a745;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px;
  }
  
  .btn-delivered:hover {
    background-color: #218838;
  }
  </style>
  
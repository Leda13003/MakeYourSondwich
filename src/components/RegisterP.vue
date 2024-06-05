<template>
  <div class="auth-container">
    <div class="auth-card">
      <h2>Inscription</h2>
      <form @submit.prevent="register">
        <div class="input-group">
          <label for="username">Nom d'utilisateur</label>
          <input type="text" v-model="username" id="username" required>
        </div>
        <div class="input-group">
          <label for="email">Email</label>
          <input type="email" v-model="email" id="email" required>
        </div>
        <div class="input-group">
          <label for="password">Mot de passe</label>
          <input type="password" v-model="password" id="password" required>
        </div>
        <button type="submit" class="btn-primary">S'inscrire</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      username: '',
      email: '',
      password: ''
    };
  },
  methods: {
    async register() {
      try {
        const response = await axios.post('http://localhost:8000/register.php', {
          username: this.username,
          email: this.email,
          password: this.password
        });
        if (response.data.success) {
          alert('Inscription réussie!');
          this.$router.push('/login-p');
        } else {
          alert('Erreur: ' + response.data.message);
        }
      } catch (error) {
        console.error('Erreur lors de l\'inscription:', error);
        alert('Erreur lors de l\'inscription.');
      }
    }
  }
};
</script>

<style scoped>
.auth-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f5f5;
}

.auth-card {
  background: white;
  padding: 40px;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
  text-align: center;
}

h2 {
  margin-bottom: 20px;
  font-size: 24px;
  color: #333;
}

.input-group {
  margin-bottom: 20px;
  text-align: left;
}

label {
  display: block;
  margin-bottom: 8px;
  color: #555;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  transition: border-color 0.3s;
}

input:focus {
  border-color: #007bff;
  outline: none;
}

.btn-primary {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
  background-color: #0056b3;
  transform: scale(1.05);
}
</style>

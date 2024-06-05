<template>
  <div class="home">
    <h1>Bienvenue {{ username }} sur Make Your Sandwich !</h1>
  </div>
      <router-link to="/base-selection" class="btn btn-primary btn-lg">Commencez à créer votre sandwich</router-link>

</template>

<script>
export default {
  data() {
    return {
      username: ''
    };
  },
  created() {
    // Récupérer les informations de l'utilisateur depuis le stockage local
    const user = JSON.parse(localStorage.getItem('user'));
    if (user) {
      this.username = user.username;
    }
  }
};
</script>

<style scoped>
.home {
  background: url('../assets/bg.jpg') no-repeat center center;
  background-size: cover;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.container {
  background-color: rgba(255, 255, 255, 0.8);
  padding: 50px;
  border-radius: 10px;
}

h1 {
  color: #d6d6d6;
  font-size: 3rem;
    margin-bottom: 25%;

}

p {
  font-size: 1.2rem;
  margin-bottom: 30px;
}

.btn {
  background-color: #ffcc00;
  color: #fff;
  font-size: 1.5rem;
  padding: 10px 30px;
  border-radius: 5px;
  transition: background-color 0.3s;
  margin-top: -55%;
    margin-left: 35%;
}

.btn:hover {
  background-color: #ffaa00;
}
</style>
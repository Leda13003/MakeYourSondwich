<template>
  <div>
    <h2>Créer votre sandwich</h2>
    <div>
      <label>Nom du client :</label>
      <input v-model="clientName" type="text" placeholder="Entrez votre nom" />
    </div>
    <div>
      <label>Choix du pain :</label>
      <select v-model="selection.pain">
        <option value="">Sélectionner</option>
        <option value="Tortilla de blé">Tortilla de blé</option>
        <option value="Tortilla de maïs">Tortilla de maïs</option>
        <option value="Baguette">Baguette</option>
      </select>
    </div>
    <div>
      <label>Choix de la viande :</label>
      <select v-model="selection.viande">
        <option value="">Sélectionner</option>
        <option value="Poulet grillé">Poulet grillé</option>
        <option value="Bœuf haché">Bœuf haché</option>
        <option value="Steak">Steak</option>
        <option value="Viande kebab">Viande kebab</option>
        <option value="Merguez">Merguez</option>
        <option value="Saucisses">Saucisses</option>
        <option value="Nuggets de poulet">Nuggets de poulet</option>
        <option value="Falafel">Falafel</option>
        <option value="Tofu">Tofu</option>
      </select>
    </div>
    <div>
      <label>Ajout de fromage :</label>
      <select v-model="selection.fromage">
        <option value="">Sélectionner</option>
        <option value="Fromage râpé">Fromage râpé</option>
        <option value="Fromage fondu">Fromage fondu</option>
        <option value="Sauce fromagère">Sauce fromagère</option>
      </select>
    </div>
    <div>
      <label>Ajout de légumes :</label>
      <div>
        <label><input type="checkbox" v-model="selection.legumes" value="Salade verte" /> Salade verte</label>
        <label><input type="checkbox" v-model="selection.legumes" value="Tomates en dés" /> Tomates en dés</label>
        <label><input type="checkbox" v-model="selection.legumes" value="Oignons émincés" /> Oignons émincés</label>
        <!-- Ajoutez d'autres options de légumes ici -->
      </div>
    </div>
    <div>
      <label>Choix des sauces :</label>
      <div>
        <label><input type="checkbox" v-model="selection.sauces" value="Sauce blanche" /> Sauce blanche</label>
        <label><input type="checkbox" v-model="selection.sauces" value="Sauce algérienne" /> Sauce algérienne</label>
        <label><input type="checkbox" v-model="selection.sauces" value="Sauce samouraï" /> Sauce samouraï</label>
        <!-- Ajoutez d'autres options de sauces ici -->
      </div>
    </div>
    <div>
      <label>Autres ingrédients :</label>
      <div>
        <label><input type="checkbox" v-model="selection.autres" value="Frites" /> Frites</label>
        <!-- Ajoutez d'autres options d'ingrédients ici -->
      </div>
    </div>
    <div>
      <label>Assaisonnement :</label>
      <div>
        <label><input type="checkbox" v-model="selection.assaisonnement" value="Sel" /> Sel</label>
        <label><input type="checkbox" v-model="selection.assaisonnement" value="Poivre" /> Poivre</label>
        <label><input type="checkbox" v-model="selection.assaisonnement" value="Paprika" /> Paprika</label>
        <!-- Ajoutez d'autres options d'assaisonnement ici -->
      </div>
    </div>
    <div>
      <label>Options supplémentaires :</label>
      <div>
        <label><input type="checkbox" v-model="selection.options" value="Olives" /> Olives</label>
        <label><input type="checkbox" v-model="selection.options" value="Jalapeños" /> Jalapeños</label>
        <label><input type="checkbox" v-model="selection.options" value="Citron" /> Citron</label>
        <!-- Ajoutez d'autres options supplémentaires ici -->
      </div>
    </div>
    <button @click="goToRecap">Voir le récapitulatif</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      clientName: '',
      selection: {
        pain: '',
        viande: '',
        fromage: '',
        legumes: [],
        sauces: [],
        autres: [],
        assaisonnement: [],
        options: []
      }
    };
  },
  methods: {
    goToRecap() {
      this.$router.push({
        name: 'Recapitulatif',
        params: {
          clientName: this.clientName,
          selection: this.selection
        }
      });
    }
  }
};
</script>

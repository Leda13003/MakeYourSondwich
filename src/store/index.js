import { createStore } from 'vuex';

export default createStore({
  state: {
    sandwiches: [],
    prices: {
      base: {
        'Tortilla de blé': 1.50,
        'Tortilla de maïs': 1.50,
        'Baguette': 2.00
      },
      proteins: {
        'Poulet grillé': 3.00,
        'Bœuf haché': 3.50,
        'Steak': 4.00,
        'Viande kebab': 3.50,
        'Merguez': 3.00,
        'Saucisses': 2.50,
        'Nuggets de poulet': 3.00,
        'Falafel': 2.50,
        'Tofu': 2.00
      },
      cheese: {
        'Fromage râpé': 1.00,
        'Fromage fondu': 1.20,
        'Sauce fromagère': 1.50
      },
      veggies: {
        'Salade verte': 0.50,
        'Tomates en dés': 0.50,
        'Oignons émincés': 0.30,
        'Poivrons en lamelles': 0.40,
        'Concombre en rondelles': 0.40,
        'Carottes râpées': 0.30,
        'Chou blanc ou rouge émincé': 0.40,
        'Champignons sautés': 0.50,
        'Cornichons en rondelles': 0.30
      },
      sauces: {
        'Sauce blanche': 0.50,
        'Sauce algérienne': 0.50,
        'Sauce samouraï': 0.50,
        'Sauce barbecue': 0.50,
        'Ketchup': 0.30,
        'Mayonnaise': 0.30,
        'Sauce harissa': 0.50,
        'Sauce andalouse': 0.50,
        'Sauce fromage': 0.50
      },
      extras: {
        'Frites': 1.00,
        'Olives': 0.50,
        'Jalapeños': 0.50,
        'Citron': 0.30
      },
      seasonings: {
        'Sel': 0.10,
        'Poivre': 0.10,
        'Paprika': 0.10,
        'Cumin': 0.10,
        'Coriandre': 0.10,
        'Ail en poudre': 0.10,
        'Oignon en poudre': 0.10,
        'Herbes de Provence': 0.10
      },
      drink: {
        'Coca-Cola': 1.50,
        'Pepsi': 1.50,
        'Sprite': 1.50,
        'Fanta': 1.50,
        'Dr. Pepper': 1.50,
        'Mountain Dew': 1.50,
        '7UP': 1.50,
        'Ginger Ale': 1.50,
        'Root Beer': 1.50,
        'Orangina': 1.50
      },
      dessert: {
        'Brownies': 2.00,
        'Cookies': 2.00,
        'Muffins': 2.50,
        'Cheesecake': 3.00,
        'Tarte aux pommes': 3.00,
        'Gâteau au chocolat': 3.00,
        'Beignets': 2.00,
        'Éclairs': 3.00,
        'Tiramisu': 3.00,
        'Glace': 2.50
      }
    }
  },
  mutations: {
    setBase(state, base) {
      state.sandwiches.push({
        base: base.base,
        basePrice: base.price,
        proteins: [],
        cheese: '',
        cheesePrice: 0,
        veggies: [],
        sauces: [],
        extras: [],
        seasonings: [],
        drink: '',
        drinkPrice: 0,
        dessert: '',
        dessertPrice: 0,
        total: base.price
      });
    },
    setProteins(state, proteins) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.proteins = proteins.map(protein => ({ name: protein.name, price: protein.price, quantity: 1 }));
      lastSandwich.total += proteins.reduce((acc, protein) => acc + protein.price, 0);
    },
    setCheese(state, cheese) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.cheese = cheese.cheese;
      lastSandwich.cheesePrice = cheese.price;
      lastSandwich.total += cheese.price;
    },
    setVeggies(state, veggies) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.veggies = veggies;
      lastSandwich.total += veggies.reduce((acc, veggie) => acc + veggie.price, 0);
    },
    setSauces(state, sauces) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.sauces = sauces;
      lastSandwich.total += sauces.reduce((acc, sauce) => acc + sauce.price, 0);
    },
    setExtras(state, extras) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.extras = extras;
      lastSandwich.total += extras.reduce((acc, extra) => acc + extra.price, 0);
    },
    setSeasonings(state, seasonings) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.seasonings = seasonings;
      lastSandwich.total += seasonings.reduce((acc, seasoning) => acc + seasoning.price, 0);
    },
    setDrink(state, drink) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.drink = drink.drink;
      lastSandwich.drinkPrice = drink.price;
      lastSandwich.total += drink.price;
    },
    setDessert(state, dessert) {
      const lastSandwich = state.sandwiches[state.sandwiches.length - 1];
      lastSandwich.dessert = dessert.dessert;
      lastSandwich.dessertPrice = dessert.price;
      lastSandwich.total += dessert.price;
    },
    resetOrder(state) {
      state.sandwiches = [];
    }
  },
  actions: {},
  modules: {}
});

import { createRouter, createWebHistory } from 'vue-router';
import HomeP from '../components/HomeP.vue';
import BaseSelection from '../components/BaseSelection.vue';
import ProteinSelection from '../components/ProteinSelection.vue';
import CheeseSelection from '../components/CheeseSelection.vue';
import VeggieSelection from '../components/VeggieSelection.vue';
import SauceSelection from '../components/SauceSelection.vue';
import ExtrasSelection from '../components/ExtrasSelection.vue';
import SeasoningSelection from '../components/SeasoningSelection.vue';
import DrinkSelection from '../components/DrinkSelection.vue';
import DessertSelection from '../components/DessertSelection.vue';
import FinalStep from '../components/FinalStep.vue';
import AboutP from '../components/AboutP.vue';
import ContactP from '../components/ContactP.vue';
import LoginP from '../components/LoginP.vue';
import RegisterP from '../components/RegisterP.vue';
import ViewOrders from '@/components/ViewOrders.vue';

const routes = [
  { path: '/', component: HomeP },
  { path: '/base-selection', component: BaseSelection },
  { path: '/protein-selection', component: ProteinSelection },
  { path: '/cheese-selection', component: CheeseSelection },
  { path: '/veggie-selection', component: VeggieSelection },
  { path: '/sauce-selection', component: SauceSelection },
  { path: '/extras-selection', component: ExtrasSelection },
  { path: '/seasoning-selection', component: SeasoningSelection },
  { path: '/drink-selection', component: DrinkSelection },
  { path: '/dessert-selection', component: DessertSelection },
  { path: '/final-step', component: FinalStep },
  { path: '/about-p', component: AboutP },
  { path: '/contact-p', component: ContactP },
  { path: '/login-p', component: LoginP },
  { path: '/register-p', component: RegisterP },
  { path: '/view-orders', name: 'ViewOrders', component: ViewOrders }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

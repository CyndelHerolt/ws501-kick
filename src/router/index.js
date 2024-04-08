import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Concept from '../components/Concept.vue'
import Recompenses from '../components/Recompenses.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/concept',
      name: 'home',
      component: HomeView,
      children: [
        {
          path: 'concept',
          component: Concept
        },
        {
          path: 'recompenses',
          component: Recompenses
        },
      ]
    },
  ]
})

export default router

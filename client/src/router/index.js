import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/register',
        name: 'register',
        //lazy loading of components - for performance improvement
        component: () => import('../components/Register.vue')
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
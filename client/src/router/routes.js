const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      { path: '/home', name: "home", component: () => import('pages/Index.vue') },
      {
        path: '/login',
        name: 'login',
        //lazy loading of components - for performance improvement
        component: () => import('../components/Login.vue')
    },
    {
      path: '/register',
      name: 'register',
      //lazy loading of components - for performance improvement
      component: () => import('../components/Register.vue')
  }
    ]
  },


  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/Error404.vue')
  }
]

export default routes

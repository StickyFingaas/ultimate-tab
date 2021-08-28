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
  },
  {
    path: '/songs',
    name: 'songs',
    //lazy loading of components - for performance improvement
    component: () => import('../components/Songs.vue')
},
{
  path: '/songs/:songId',
  name: 'song',
  //lazy loading of components - for performance improvement
  component: () => import('../components/ViewSong.vue')
},
{
    path: '/create',
    name: 'create',
    //lazy loading of components - for performance improvement
    component: () => import('../components/CreateSong.vue')
},
{
  path: '/edit/:songId',
  name: 'edit',
  //lazy loading of components - for performance improvement
  component: () => import('../components/EditSong.vue')
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

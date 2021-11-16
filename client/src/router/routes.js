const routes = [
  {
    path: '/',
    redirect: 'songs',
    component: () => import('layouts/MainLayout.vue'),
    children: [
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
    component: () => import('../components/Songs/Index.vue')
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
},
{
  path: '/bookmarks/:userId',
  name: 'bookmarks',
  //lazy loading of components - for performance improvement
  component: () => import('../components/SongsBookmarks.vue')
},
{
  path: '/history/:userId',
  name: 'history',
  //lazy loading of components - for performance improvement
  component: () => import('../components/RecentlyViewed.vue')
},
{
  path: '/song-list',
  name: 'song-list',
  //lazy loading of components - for performance improvement
  component: () => import('../components/SongList.vue')
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

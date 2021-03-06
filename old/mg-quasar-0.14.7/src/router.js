import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

function load (component) {
  // '@' is aliased to src/components
  return () => import(`@/${component}.vue`)
}

export default new VueRouter({
  /*
   * NOTE! VueRouter "history" mode DOESN'T works for Cordova builds,
   * it is only to be used only for websites.
   *
   * If you decide to go with "history" mode, please also open /config/index.js
   * and set "build.publicPath" to something other than an empty string.
   * Example: '/' instead of current ''
   *
   * If switching back to default "hash" mode, don't forget to set the
   * build publicPath back to '' so Cordova builds work again.
   */

  routes: [
    // Básicos
    { path: '/', component: load('Index') }, // Default
    { path: '/login', component: load('Login') }, // Login

    // Marca
    { path: '/marca', component: load('views/marca/Index') },
    { path: '/marca/create', component: load('views/marca/Create') },
    { path: '/marca/:id', component: load('views/marca/View') },
    { path: '/marca/:id/foto', component: load('views/marca/Photo') },
    { path: '/marca/:id/update', component: load('views/marca/Update') },

    // Grupo de Usuarios
    { path: '/usuario', component: load('views/usuario/Index') },
    { path: '/usuario/create', component: load('views/usuario/Create') },
    { path: '/usuario/perfil', component: load('views/usuario/Profile') },
    { path: '/usuario/impressoras', component: load('views/usuario/Print') },
    { path: '/usuario/foto', component: load('views/usuario/Photo') },
    { path: '/usuario/senha', component: load('views/usuario/Password') },
    { path: '/usuario/grupo-usuario/:id', name: 'grupo-usuario', component: load('views/usuario/Index') },
    { path: '/usuario/:id', component: load('views/usuario/View') },
    { path: '/usuario/:id/update', component: load('views/usuario/Update') },
    { path: '/usuario/:id/grupos', component: load('views/usuario/Grupos') },

    // Permissao
    { path: '/permissao', component: load('views/permissao/Index') },

    // Estoque Estatística
    { path: '/estoque-estatistica/:codproduto', component: load('views/estoque-estatistica/Index') },

    // Always leave this last one
    { path: '*', component: load('Error404') } // Not found
  ]
})

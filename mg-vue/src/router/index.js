import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import VuetifyTest from '@/components/VuetifyTest'
import MarcaListagem from '@/components/crud/marca/Listagem'
import Login from '@/components/Login'

Vue.use(Router)

const routes = [
  {
    path: '/',
    name: 'Hello',
    component: Hello,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/Login',
    name: 'Login',
    component: Login
  },
  {
    path: '/vuetify-test',
    name: 'VuetifyTest',
    component: VuetifyTest,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/marca',
    name: 'MarcaListagem',
    component: MarcaListagem,
    meta: { requerAutenticacao: true }
  }
]

const router = new Router({
  routes: routes
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(m => m.meta.requerAutenticacao)) {
    window.axios.get('http://api.notmig01.teste/api/auth/check').then(response => {
      if (response.data.autenticado) {
        return next()
      }
      return next({ path: '/Login' })
    }).catch(error => {
      console.log(error.response)
    })
  }
  return next()
})

export default router

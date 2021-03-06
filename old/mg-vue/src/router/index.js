import Vue from 'vue'
import Router from 'vue-router'
import Hello from '@/components/Hello'
import VuetifyTest from '@/components/VuetifyTest'
import MarcaListagem from '@/components/crud/marca/Listagem'
import MarcaNova from '@/components/crud/marca/Nova'
import MarcaDetalhe from '@/components/crud/marca/Detalhe'
import MarcaEditar from '@/components/crud/marca/Editar'
import MarcaImagem from '@/components/crud/marca/Imagem'

import PermissaoListagem from '@/components/crud/permissao/Listagem'

import GrupoUsuarioListagem from '@/components/crud/grupo-usuario/Listagem'
import GrupoUsuarioNovo from '@/components/crud/grupo-usuario/Novo'
import GrupoUsuarioDetalhe from '@/components/crud/grupo-usuario/Detalhe'
import GrupoUsuarioEditar from '@/components/crud/grupo-usuario/Editar'

import UsuarioListagem from '@/components/crud/usuario/Listagem'
import UsuarioNovo from '@/components/crud/usuario/Novo'
import UsuarioDetalhe from '@/components/crud/usuario/Detalhe'
import UsuarioEditar from '@/components/crud/usuario/Editar'
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
    path: '/login',
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
  },
  {
    path: '/marca/nova',
    name: 'marca-nova',
    component: MarcaNova,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/marca/:id',
    name: 'marca',
    component: MarcaDetalhe,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/marca/:id/editar',
    name: 'marca-editar',
    component: MarcaEditar,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/marca/:id/imagem',
    name: 'marca-imagem',
    component: MarcaImagem,
    meta: { requerAutenticacao: true }
  },

  // Usuários
  {
    path: '/usuario',
    name: 'suarioListagem',
    component: UsuarioListagem,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/usuario/novo',
    name: 'usuario-nova',
    component: UsuarioNovo,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/usuario/:id',
    name: 'usuario-detalhe',
    component: UsuarioDetalhe,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/usuario/:id/editar',
    name: 'usuario-editar',
    component: UsuarioEditar,
    meta: { requerAutenticacao: true }
  },

  // Grupos de usuário
  {
    path: '/grupo-usuario',
    name: 'GrupoUsuarioListagem',
    component: GrupoUsuarioListagem,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/grupo-usuario/novo',
    name: 'grupo-usuario-nova',
    component: GrupoUsuarioNovo,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/grupo-usuario/:id',
    name: 'grupo-usuario-detalhe',
    component: GrupoUsuarioDetalhe,
    meta: { requerAutenticacao: true }
  },
  {
    path: '/grupo-usuario/:id/editar',
    name: 'grupo-usuario-editar',
    component: GrupoUsuarioEditar,
    meta: { requerAutenticacao: true }
  },

  // Permissões
  {
    path: '/permissao',
    name: 'permissao',
    component: PermissaoListagem,
    meta: { requerAutenticacao: true }
  }
]

const router = new Router({
  routes: routes
})

export default router

import Vue from 'vue'
import Vuex from 'vuex'

import example from './module-example'
import aplicativos from './aplicativos'
import perfil from './perfil'
import filtroMarca from './filtro/marca'
import filtroUsuario from './filtro/usuario'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    example,
    aplicativos,
    perfil,
    filtroMarca,
    filtroUsuario
  }
})

export default store

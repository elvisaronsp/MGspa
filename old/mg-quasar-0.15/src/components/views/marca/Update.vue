<template>
  <mg-layout>

    <q-btn flat round slot="menu" @click="$router.push('/marca/' + data.codmarca)">
      <q-icon name="arrow_back" />
    </q-btn>

    <q-btn flat round icon="done" slot="menuRight" @click.native="update()" />

    <template slot="title">
      {{ data.marca }}
    </template>

    <div slot="content">
      <div class="layout-padding">
        <form @submit.prevent="update()">

          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
              <q-field>
                <q-input
                  type="text"
                  v-model="data.marca"
                  float-label="Marca"
                />
              </q-field>
              <mg-erros-validacao :erros="erros.marca"></mg-erros-validacao>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
              <q-field>
                <q-toggle v-model="data.abcignorar" label="Ignorar curva ABC" />
              </q-field>
              <mg-erros-validacao :erros="erros.abcignorar"></mg-erros-validacao>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
              <q-field>
                <q-toggle v-model="data.controlada" label="Controlada" />
              </q-field>
              <mg-erros-validacao :erros="erros.controlada"></mg-erros-validacao>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
              <q-field>
                <q-toggle v-model="data.site" label="Disponível no site" />
              </q-field>
              <mg-erros-validacao :erros="erros.descricao"></mg-erros-validacao>
            </div>
          </div>

          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
              <q-field>
                <q-input
                  v-model="data.descricaosite"
                  type="textarea"
                  float-label="Descrição do site"
                  :max-height="100"
                  :min-rows="3"
                />
              </q-field>
              <mg-erros-validacao :erros="erros.descricao"></mg-erros-validacao>
            </div>
          </div>

        </form>
      </div>
    </div>

  </mg-layout>
</template>

<script>

import MgLayout from '../../../layouts/MgLayout'
import MgErrosValidacao from '../../utils/MgErrosValidacao'

export default {
  name: 'usuario-create',
  components: {
    MgLayout,
    MgErrosValidacao
  },
  data () {
    return {
      data: {},
      erros: false
    }
  },
  methods: {
    loadData: function (id) {
      let vm = this
      vm.$axios.get('marca/' + id).then(function (request) {
        vm.data = request.data
      }).catch(function (error) {
        console.log(error.response)
      })
    },
    update: function () {
      var vm = this
      vm.$q.dialog({
        title: 'Salvar',
        message: 'Tem certeza que deseja salvar?',
        ok: 'Salvar',
        cancel: 'Cancelar'
      }).then(() => {
        vm.$axios.put('marca/' + vm.data.codmarca, vm.data).then(function (request) {
          vm.$q.notify({
            message: 'Marca alterada',
            type: 'positive',
          })
          vm.$router.push('/marca/' + request.data.codmarca)
        }).catch(function (error) {
          vm.erros = error.response.data.erros
        })
      })
    }
  },
  created () {
    this.loadData(this.$route.params.id)
  }}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>

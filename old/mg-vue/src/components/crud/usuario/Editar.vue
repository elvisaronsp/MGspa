<template>
  <mg-layout>

    <template slot="titulo">
      Editar Usuário
    </template>

    <template slot="menu">
      <div class="container">
      </div>
    </template>

    <template slot="conteudo">
      <v-card class="elevation-0">
          <v-card-text>
            <v-container fluid>
              <form autocomplete="off" @submit.prevent="update">
                <v-layout row>
                  <v-flex xs12>
                    <v-text-field
                      name="input-2"
                      label="Grupo"
                      v-model="dados.usuario"
                      autofocus
                      required
                    ></v-text-field>
                    <v-btn type="submit" primary light>Salvar</v-btn>
                  </v-flex>
                </v-layout>
              </form>
            </v-container>
          </v-card-text>
        </v-card>

        <v-btn router :to="{path: '/usuario/novo'}" class="red white--text" light fixed bottom right fab>
          <v-icon>add</v-icon>
        </v-btn>

    </template>

    <!--
    <div fixed slot="rodape">
    </div>
    -->

  </mg-layout>
</template>

<script>
import MgLayout from '../../layout/MgLayout'

export default {
  name: 'hello',
  components: {
    MgLayout
  },
  data () {
    return {
      dados: {}
    }
  },
  methods: {
    carregaDados: function (id) {
      var vm = this
      window.axios.get('usuario/' + this.$route.params.id).then(function (request) {
        vm.dados = request.data
      }).catch(function (error) {
        console.log(error.response)
      })
    },
    update: function () {
      var vm = this
      window.axios.put('usuario/' + this.$route.params.id, vm.dados).then(function (request) {
        vm.$router.push('/usuario/' + request.data.codusuario)
      }).catch(function (error) {
        console.log(error.response)
      })
    }
  },
  mounted () {
    this.carregaDados(this.$route.params.id)
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>

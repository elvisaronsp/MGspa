<template>
  <div id="app">
    <v-snackbar
      v-model="snackbar.mostrar"
      :info="snackbar.info"
      :warning="snackbar.warning"
      :error="snackbar.error"
      :primary="snackbar.primary"
      :secondary="snackbar.secondary"
      :success="snackbar.success"
      > {{ snackbar.mensagem }} </v-snackbar>
      <transition name="fade-transition">
        <router-view></router-view>
      </transition>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
    }
  },
  computed: {
    snackbar () {
      return this.$store.getters['snackbar/dados']
    }
  }
}
</script>

<style>
  #app {
    height: 100%
  }
  .btn--floating {
    z-index: 4;
  }
  .speed-dial {
    z-index: 5;
  }

  dt {
    font-size: 0.8em;
    color: grey;
  }
  dd {
    margin-bottom: 7px;
    font-weight: 300;
  }

</style>

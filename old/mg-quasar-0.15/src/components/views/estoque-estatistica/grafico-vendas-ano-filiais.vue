<script>
import {
  Bar
} from 'vue-chartjs'

import { debounce } from 'quasar'

export default {
  name: 'grafico-vendas-ano-filiais',
  extends: Bar,
  props: ['locais', 'saldoquantidade', 'vendaquantidade'],
  data () {
    return {
      data: {
        labels: [],
        datasets: [
          {
            label: 'Vendas',
            backgroundColor: 'rgba(63, 81, 181, 0.7)',
            data: null
          },
          {
            label: 'Estoque',
            backgroundColor: '#f00',
            data: null
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    }
  },
  watch: {
    locais: {
      handler: function (val, oldVal) {
        this.atualizaGrafico()
      },
      deep: true
    }
  },
  mounted () {
    this.renderChart(this.data, this.options)
  },
  methods: {
    update () {
      this.$data._chart.update()
    },

    atualizaGrafico: debounce(function () {
      let vm = this

      // acumula dados para os datasets
      let locais = []
      let vendaquantidade = []
      let saldoquantidade = []

      this.locais.forEach(function (estoquelocal) {
        locais.push(estoquelocal.estoquelocal)
        vendaquantidade.push(estoquelocal.vendaquantidade)
        saldoquantidade.push(estoquelocal.saldoquantidade)
      })

      locais.push('Total')
      vendaquantidade.push(vm.vendaquantidade)
      saldoquantidade.push(vm.saldoquantidade)

      // passa para datasets os valores acumulados
      vm.data.datasets[0].data = vendaquantidade
      vm.data.datasets[1].data = saldoquantidade
      vm.data.labels = locais

      // atualiza grafico
      vm.update()
    }, 100)
  }
}
</script>

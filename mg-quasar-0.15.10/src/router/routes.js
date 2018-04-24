
export default [
  // Básicos
  { path: '/', component: () => import('components/Index') }, // Default
  { path: '/login', component: () => import('components/Login') }, // Login
  { path: '*', component: () => import('components/Error404') },

  // Marca
  { path: '/marca', component: () => import('components/views/marca/Index') },
  { path: '/marca/create', component: () => import('components/views/marca/Create') },
  { path: '/marca/:id', component: () => import('components/views/marca/View') },
  { path: '/marca/:id/foto', component: () => import('components/views/marca/Photo') },
  { path: '/marca/:id/update', component: () => import('components/views/marca/Update') },

  // Grupo de Usuarios
  { path: '/usuario', component: () => import('components/views/usuario/Index') },
  { path: '/usuario/create', component: () => import('components/views/usuario/Create') },
  { path: '/usuario/perfil', component: () => import('components/views/usuario/Profile') },
  { path: '/usuario/impressoras', component: () => import('components/views/usuario/Print') },
  { path: '/usuario/foto', component: () => import('components/views/usuario/Photo') },
  { path: '/usuario/senha', component: () => import('components/views/usuario/Password') },
  { path: '/usuario/grupo-usuario/:id', name: 'grupo-usuario', component: () => import('components/views/usuario/Index') },
  { path: '/usuario/:id', component: () => import('components/views/usuario/View') },
  { path: '/usuario/:id/update', component: () => import('components/views/usuario/Update') },
  { path: '/usuario/:id/grupos', component: () => import('components/views/usuario/Grupos') },

  // Permissao
  { path: '/permissao', component: () => import('components/views/permissao/Index') },

  // Filiais
  { path: '/filial', component: () => import('components/views/filial/Index') },

  // Estoque Estatística
  { path: '/estoque-estatistica/:codproduto', component: () => import('components/views/estoque-estatistica/Index') },

  // Estoque Conferência
  { path: '/estoque-saldo-conferencia', component: () => import('components/views/estoque-saldo-conferencia/Index') },
  { path: '/estoque-saldo-conferencia/conferencia/:codestoquelocal/:codmarca/:fiscal', component: () => import('components/views/estoque-saldo-conferencia/Conferencia/') },
  { path: '/estoque-saldo-conferencia/create', component: () => import('components/views/estoque-saldo-conferencia/Create') },
  { path: '/estoque-saldo-conferencia/historicoconferencia', component: () => import('components/views/estoque-saldo-conferencia/HistoricoConferencia') }
]

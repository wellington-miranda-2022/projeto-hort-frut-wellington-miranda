program HortiFrut;

uses
  Forms,
  splashU in 'splashU.pas' {frmSplash},
  loginU in 'loginU.pas' {frmLogin},
  principalU in 'principalU.pas' {frmPrincipal},
  usuariosU in 'usuariosU.pas' {frm_Usuarios},
  clientesU in 'clientesU.pas' {frm_Clientes},
  cidadesU in 'icons\Hort Frut\cidadesU.pas' {frm_Cidades},
  fornecedoresU in 'fornecedoresU.pas' {frm_Fornecedores},
  produtosU in 'produtosU.pas' {frm_Produtos},
  buscarprodutoU in 'buscarprodutoU.pas' {frm_BuscarProduto},
  novopedU in 'novopedU.pas' {frm_NovoPed},
  vendasU in 'vendasU.pas' {frm_Vendas},
  buscarprodutovendaU in 'buscarprodutovendaU.pas' {frm_BuscarProdutoVenda},
  listapedU in 'listapedU.pas' {frm_ListaPedido},
  insertqtdU in 'insertqtdU.pas' {frm_InserirQtd},
  comprasU in 'comprasU.pas' {frm_Compras},
  listavenddetalhes in 'listavenddetalhes.pas' {frm_ListaVendaDetalhes},
  listacompdetalhesU in 'listacompdetalhesU.pas' {frm_ListaCompDetalhes},
  avariaU in 'avariaU.pas' {frm_Avaria},
  contasapagarU in 'contasapagarU.pas' {frm_ContasPagar},
  contaseditar in 'contaseditar.pas' {frm_ContasEditar},
  darbaixacontas in 'darbaixacontas.pas' {frm_BaixaContasPagar},
  contasreceber in 'contasreceber.pas' {frm_ContasReceber},
  lancamentopagU in 'lancamentopagU.pas' {frm_LancamentosPag},
  editreceberU in 'editreceberU.pas' {frm_EditReceber},
  planodecontasU in 'planodecontasU.pas' {frm_PlanoContas},
  baixareceberU in 'baixareceberU.pas' {frm_BaixaReceber},
  contabancoU in 'contabancoU.pas' {frm_ContaBanco},
  modeloconsulta in 'modeloconsulta.pas' {frmModelo},
  consultaclientesU in 'consultaclientesU.pas' {frm_ConsultaClientes},
  consultafornecedoresU in 'consultafornecedoresU.pas' {frm_ConsultaFornecedores},
  consultaprodutosU in 'consultaprodutosU.pas' {frm_ConsultaProdutos},
  consultacomprasU in 'consultacomprasU.pas' {frm_ConsultaCompras},
  consultavendasU in 'consultavendasU.pas' {frm_ConsultaVendas},
  consultapagar in 'consultapagar.pas' {frm_ConsultaPagar},
  consultapedidosU in 'consultapedidosU.pas' {frm_ConsultaPedidos},
  contasU in 'contasU.pas' {frm_Contas},
  newcontaU in 'newcontaU.pas' {frm_NewBanco},
  consultabancosU in 'consultabancosU.pas' {frm_ConsultaBancos},
  contacorrenteU in 'contacorrenteU.pas' {frm_ContaCorrentes},
  newcontacorrentesU in 'newcontacorrentesU.pas' {frm_NewContaCorrentes},
  movimentacoesU in 'movimentacoesU.pas' {frm_Movimentacao},
  newmovimentacoesU in 'newmovimentacoesU.pas' {frm_NewMovimentacao},
  frm_ConciliarU in 'frm_ConciliarU.pas' {frm_Conciliar},
  consultareceberU in 'consultareceberU.pas' {frm_ConsultaReceber},
  dashboardU in 'dashboardU.pas' {frm_Dashboard},
  consultausuarios in 'consultausuarios.pas',
  Fbackup in 'Fbackup.pas' {frmBackup},
  ajustesU in 'ajustesU.pas' {frm_Ajustes},
  chamarvendaU in 'chamarvendaU.pas' {frm_ChamarVenda},
  frm_RelatorioPesquisa in 'frm_RelatorioPesquisa.pas' {frmRelatorio_Pesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tfrm_Ajustes, frm_Ajustes);
  Application.CreateForm(Tfrm_ChamarVenda, frm_ChamarVenda);
  Application.CreateForm(TfrmRelatorio_Pesquisa, frmRelatorio_Pesquisa);
  Application.Run;
end.

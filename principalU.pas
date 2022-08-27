unit principalU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, DB,
  DBTables, Buttons, Menus, ComCtrls, ZipMstr, Gauges,DateUtils;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Consultas1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Produto1: TMenuItem;
    Cidades1: TMenuItem;
    Compra1: TMenuItem;
    Venda1: TMenuItem;
    N1: TMenuItem;
    Sair2: TMenuItem;
    InformaesSobreoSistema1: TMenuItem;
    Ccontato1: TMenuItem;
    Usurio1: TMenuItem;
    Fornecedor1: TMenuItem;
    Cidade1: TMenuItem;
    N2: TMenuItem;
    Produto2: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Bevel1: TBevel;
    XPManifest1: TXPManifest;
    Bevel3: TBevel;
    Bevel4: TBevel;
    SpeedButton8: TSpeedButton;
    Cidades2: TMenuItem;
    SpeedButton9: TSpeedButton;
    M1: TMenuItem;
    NovoPedido1: TMenuItem;
    FazerLogof1: TMenuItem;
    Fazerlogoff1: TMenuItem;
    Sair3: TMenuItem;
    NovaVenda1: TMenuItem;
    NovoProduto1: TMenuItem;
    InserirQuantidade1: TMenuItem;
    NovaCompra1: TMenuItem;
    Avarias1: TMenuItem;
    N3: TMenuItem;
    ContasaPagar1: TMenuItem;
    Bevel2: TBevel;
    btnFinanceiro: TSpeedButton;
    ContasaReceber1: TMenuItem;
    N4: TMenuItem;
    PlanodeConta1: TMenuItem;
    btnReceber: TSpeedButton;
    btnPagar: TSpeedButton;
    Usurios2: TMenuItem;
    Venda2: TMenuItem;
    Financeiro1: TMenuItem;
    APagar1: TMenuItem;
    AReceber1: TMenuItem;
    N5: TMenuItem;
    Pedidos1: TMenuItem;
    Financeiro2: TMenuItem;
    BancoLocal1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Movimentao1: TMenuItem;
    N6: TMenuItem;
    Bancos1: TMenuItem;
    Dashboard1: TMenuItem;
    SpeedButton7: TSpeedButton;
    Backup1: TMenuItem;
    BackupSegurana1: TMenuItem;
    Configuraes1: TMenuItem;
    ZerarEstoque1: TMenuItem;
    btnMovimentacoes: TSpeedButton;
    btnDashboard: TSpeedButton;
    PagarReceber1: TMenuItem;
    DespesasReceita1: TMenuItem;
    VendanoPerodo1: TMenuItem;
    BalanoVendas1: TMenuItem;
    PlanodeContas1: TMenuItem;
    Ajustar1: TMenuItem;
    ZipMaster1: TZipMaster;
    porcentagem: TLabel;
    ProgressBar1: TProgressBar;
    aviso: TStaticText;
    Timer2: TTimer;
    Usurios3: TMenuItem;
    Ativos1: TMenuItem;
    Inativos1: TMenuItem;
    Query1: TQuery;
    Clientes2: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Cidades2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FazerLogof1Click(Sender: TObject);
    procedure Fazerlogoff1Click(Sender: TObject);
    procedure Sair3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure NovoPedido1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NovaVenda1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure NovoProduto1Click(Sender: TObject);
    procedure InserirQuantidade1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure NovaCompra1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Avarias1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
    procedure PlanodeConta1Click(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
    procedure btnFinanceiroMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Usurios2Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Produto2Click(Sender: TObject);
    procedure Venda2Click(Sender: TObject);
    procedure APagar1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure BancoLocal1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure Movimentao1Click(Sender: TObject);
    procedure AReceber1Click(Sender: TObject);
    procedure BackupSegurana1Click(Sender: TObject);
    procedure ZerarEstoque1Click(Sender: TObject);
    procedure btnMovimentacoesClick(Sender: TObject);
    procedure btnDashboardClick(Sender: TObject);
    procedure PagarReceber1Click(Sender: TObject);
    procedure DespesasReceita1Click(Sender: TObject);
    procedure VendanoPerodo1Click(Sender: TObject);
    procedure BalanoVendas1Click(Sender: TObject);
    procedure PlanodeContas1Click(Sender: TObject);
    procedure Ajustar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure Ativos1Click(Sender: TObject);
    procedure Inativos1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
  private
    procedure Backup;
    procedure procura;
    procedure Ajustar;
    function AbrirRelatorio(Nome: String):String;

  public
  diretorio : String;
  form_entrada : String;
  relatorio : String;

  procedure CarregarCor;
  


  end;

var
  frmPrincipal: TfrmPrincipal;
  nome,senha,tipo, nomecompleto : String;
  listcliente,listvalor, listtotal,listqtd,listtotaldetalhes : String;
  inserirqtd : Integer;
  codfiltro : Integer;
  tabind : String;
  perc_venda, primeiro_planoconta, cc_debito, prazo_dias, cc_credito : Real;


implementation

uses usuariosU, clientesU, cidadesU, fornecedoresU, produtosU, pedidoU,
  loginU, novopedU, vendasU, listapedU, insertqtdU, comprasU,
  listavenddetalhes, listacompdetalhesU, avariaU, contasapagarU,
  contasreceber, planodecontasU, modeloconsulta, consultausuarios,
  consultaclientesU, consultafornecedoresU, consultaprodutosU,
  consultacomprasU, buscarprodutovendaU, consultavendasU, consultapagar,
  consultapedidosU, contasU, consultabancosU,
  contacorrenteU, movimentacoesU, consultareceberU, dashboardU, Fbackup,
  ajustesU, frm_RelatorioPesquisa;

{$R *.dfm}

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  progressbar1.Position := progressbar1.Position + 1;
          porcentagem.Caption := inttostr(progressbar1.Position)+'%';


if progressbar1.position = 100 then
progressbar1.Position := 100;
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
Backup;
Application.Terminate;
end;

procedure TfrmPrincipal.Sair2Click(Sender: TObject);
begin
Backup;
Application.Terminate;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
frm_Usuarios := Tfrm_Usuarios.Create(self);
frm_Usuarios.ShowModal;

try
finally
frm_Usuarios.Free;
frm_Usuarios := nil;
end;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
frm_Usuarios := Tfrm_Usuarios.Create(self);
frm_Usuarios.ShowModal;

try
finally
frm_Usuarios.Free;
frm_Usuarios := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
frm_Clientes := Tfrm_Clientes.Create(self);
frm_Clientes.ShowModal;

try

finally
frm_Clientes.Free;
frm_Clientes := nil;
end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
frm_Clientes := Tfrm_Clientes.Create(self);
frm_Clientes.ShowModal;

try

finally
frm_Clientes.Free;
frm_Clientes := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton8Click(Sender: TObject);
begin
frm_Cidades := Tfrm_Cidades.Create(self);
frm_Cidades.ShowModal;

try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure TfrmPrincipal.Cidades2Click(Sender: TObject);
begin
frm_Cidades := Tfrm_Cidades.Create(self);
frm_Cidades.ShowModal;

try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
frm_Fornecedores := Tfrm_Fornecedores.Create(self);
frm_Fornecedores.ShowModal;

try
finally
frm_Fornecedores.Free;
frm_Fornecedores := nil;
end;
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
frm_Fornecedores := Tfrm_Fornecedores.Create(self);
frm_Fornecedores.ShowModal;

try
finally
frm_Fornecedores.Free;
frm_Fornecedores := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
frm_Produtos := Tfrm_Produtos.Create(self);
frm_Produtos.ShowModal;

try
finally
frm_Produtos.Free;
frm_Produtos := nil;
end;
end;

procedure TfrmPrincipal.FazerLogof1Click(Sender: TObject);
begin
frmPrincipal.Hide;
frmLogin.Show;
end;

procedure TfrmPrincipal.Fazerlogoff1Click(Sender: TObject);
begin
CarregarCor;
frmPrincipal.Hide;
frmLogin.Show;
end;

procedure TfrmPrincipal.Sair3Click(Sender: TObject);
begin
if messageDlg('Deseja sair do sistema?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
Backup;
Application.Terminate;
end;
end;

procedure TfrmPrincipal.SpeedButton9Click(Sender: TObject);
begin
frm_NovoPed := Tfrm_NovoPed.Create(self);
frm_NovoPed.ShowModal;
try
finally
frm_NovoPed.Free;
frm_NovoPed := nil
end;
end;

procedure TfrmPrincipal.NovoPedido1Click(Sender: TObject);
begin
frm_NovoPed := Tfrm_NovoPed.Create(self);
frm_NovoPed.ShowModal;
try
finally
frm_NovoPed.Free;
frm_NovoPed := nil
end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Application.Terminate;
end;

procedure TfrmPrincipal.NovaVenda1Click(Sender: TObject);
begin

frm_ListaVendaDetalhes := Tfrm_ListaVendaDetalhes.Create(Self);
frm_ListaVendaDetalhes.ShowModal;
try
finally
frm_ListaVendaDetalhes.Free;
frm_ListaVendaDetalhes := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
frm_ListaVendaDetalhes := Tfrm_ListaVendaDetalhes.Create(Self);
frm_ListaVendaDetalhes.ShowModal;
try
finally
frm_ListaVendaDetalhes.Free;
frm_ListaVendaDetalhes := nil;
end;
end;

procedure TfrmPrincipal.NovoProduto1Click(Sender: TObject);
begin
frm_Produtos := Tfrm_Produtos.Create(self);
frm_Produtos.ShowModal;

try
finally
frm_Produtos.Free;
frm_Produtos := nil;
end;
end;

procedure TfrmPrincipal.InserirQuantidade1Click(Sender: TObject);
begin
frm_InserirQtd := Tfrm_InserirQtd.Create(self);
frm_InserirQtd.ShowModal;

try
finally
frm_InserirQtd.Free;
frm_InserirQtd := nil;
end;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
frm_ListaCompDetalhes := Tfrm_ListaCompDetalhes.Create(self);
frm_ListaCompDetalhes.ShowModal;
try
finally
frm_ListaCompDetalhes.Free;
frm_ListaCompDetalhes := nil;
end;
end;

procedure TfrmPrincipal.NovaCompra1Click(Sender: TObject);
begin
frm_Compras := Tfrm_Compras.Create(self);
frm_Compras.ShowModal;
try
finally
frm_Compras.Free;
frm_Compras := nil;
end
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
inserirqtd := 0;
tabind := '0';
Ajustar;
CarregarCor;
end;

procedure TfrmPrincipal.Avarias1Click(Sender: TObject);
begin
frm_Avaria := Tfrm_Avaria.Create(Self);
frm_Avaria.ShowModal;
try
finally
frm_Avaria.Free;
frm_Avaria := nil;
end;
end;

procedure TfrmPrincipal.Venda1Click(Sender: TObject);
begin
frm_ListaCompDetalhes := Tfrm_ListaCompDetalhes.Create(self);
frm_ListaCompDetalhes.ShowModal;
try
finally
frm_ListaCompDetalhes.Free;
frm_ListaCompDetalhes := nil;
end;
end;


procedure TfrmPrincipal.Compra1Click(Sender: TObject);
begin
frm_ListaVendaDetalhes := Tfrm_ListaVendaDetalhes.Create(Self);
frm_ListaVendaDetalhes.ShowModal;
try
finally
frm_ListaVendaDetalhes.Free;
frm_ListaVendaDetalhes := nil;
end;
end;

procedure TfrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin
frm_ContasPagar := Tfrm_ContasPagar.Create(Self);
frm_ContasPagar.ShowModal;
try
finally
frm_ContasPagar.Free;
frm_ContasPagar := nil;
end;
end;

procedure TfrmPrincipal.ContasaReceber1Click(Sender: TObject);
begin
frm_ContasReceber := Tfrm_ContasReceber.Create(Self);
frm_ContasReceber.ShowModal;
try
finally
frm_ContasReceber.Free;
frm_ContasReceber := nil;
end;
end;

procedure TfrmPrincipal.PlanodeConta1Click(Sender: TObject);
begin
frm_PlanoContas := Tfrm_PlanoContas.Create(Self);
frm_PlanoContas.ShowModal;
try
finally
frm_PlanoContas.Free;
frm_PlanoContas := nil;
end;
end;

procedure TfrmPrincipal.btnPagarClick(Sender: TObject);
begin
frm_ContasPagar := Tfrm_ContasPagar.Create(Self);
frm_ContasPagar.ShowModal;
frm_ContasPagar.Parent := frmPrincipal;
try
finally
frm_ContasPagar.Free;
frm_ContasPagar := nil;
end;
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;
end;

procedure TfrmPrincipal.btnReceberClick(Sender: TObject);
begin
frm_ContasReceber := Tfrm_ContasReceber.Create(Self);
frm_ContasReceber.ShowModal;
try
finally
frm_ContasReceber.Free;
frm_ContasReceber := nil;
end;
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;
end;

procedure TfrmPrincipal.btnFinanceiroMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btnReceber.Visible := true;
btnPagar.Visible := true;
btnMovimentacoes.Visible := true;
btnDashboard.Visible := true;
end;

procedure TfrmPrincipal.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;
end;

procedure TfrmPrincipal.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
Showmessage(nome);
end;

procedure TfrmPrincipal.Usurios2Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaUsuarios) then
begin
  frm_ConsultaUsuarios := Tfrm_ConsultaUsuarios.Create(Self);
end;
  frm_ConsultaUsuarios.Show;
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaClientes)then
begin
  frm_ConsultaClientes := Tfrm_ConsultaClientes.Create(Self);
end;
  frm_ConsultaClientes.Show;
end;

procedure TfrmPrincipal.Fornecedor1Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaFornecedores) then
begin
  frm_ConsultaFornecedores := Tfrm_ConsultaFornecedores.Create(Self);
end;
  frm_ConsultaFornecedores.Show;
end;

procedure TfrmPrincipal.Cidade1Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaProdutos) then
begin
  frm_ConsultaProdutos := Tfrm_ConsultaProdutos.Create(Self);
end;
  frm_ConsultaProdutos.Show;
end;

procedure TfrmPrincipal.Produto2Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaCompras) then
begin
  frm_ConsultaCompras := Tfrm_ConsultaCompras.Create(Self);
end;
  frm_ConsultaCompras.Show;
end;

procedure TfrmPrincipal.Venda2Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaVendas) then
begin
  frm_ConsultaVendas := Tfrm_ConsultaVendas.Create(Self);
end;
  frm_ConsultaVendas.Show;
end;

procedure TfrmPrincipal.APagar1Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaPagar)then
begin
  frm_ConsultaPagar := Tfrm_ConsultaPagar.Create(Self);
end;
  frm_ConsultaPagar.Show;
end;

procedure TfrmPrincipal.Pedidos1Click(Sender: TObject);
begin
if not Assigned(frm_ConsultaPedidos)then
begin
frm_ConsultaPedidos := Tfrm_ConsultaPedidos.Create(Self);
end;
frm_ConsultaPedidos.Show;
end;

procedure TfrmPrincipal.BancoLocal1Click(Sender: TObject);
begin
frm_Contas := Tfrm_Contas.Create(Self);
frm_Contas.ShowModal;
try
finally
frm_Contas.Free;
frm_Contas := nil;
end;
end;

procedure TfrmPrincipal.Bancos1Click(Sender: TObject);
begin
frm_ConsultaBancos := Tfrm_ConsultaBancos.Create(Self);
frm_ConsultaBancos.ShowModal;
try
finally
frm_ConsultaBancos.Free;
frm_ConsultaBancos := nil;
end;
end;

procedure TfrmPrincipal.ContaCorrente1Click(Sender: TObject);
begin
frm_ContaCorrentes := Tfrm_ContaCorrentes.Create(Self);
frm_ContaCorrentes.ShowModal;
try
finally
frm_ContaCorrentes.Free;
frm_ContaCorrentes := nil;
end;
end;

procedure TfrmPrincipal.Movimentao1Click(Sender: TObject);
begin
frm_Movimentacao := Tfrm_Movimentacao.Create(Self);
frm_Movimentacao.ShowModal;
try
finally
frm_Movimentacao.Free;
frm_Movimentacao := nil;
end;
end;

procedure TfrmPrincipal.AReceber1Click(Sender: TObject);
begin
frm_ConsultaReceber := Tfrm_ConsultaReceber.Create(Self);
frm_ConsultaReceber.ShowModal;
try
finally
frm_ConsultaReceber.Free;
frm_ConsultaReceber := nil;
end;
end;

procedure TfrmPrincipal.BackupSegurana1Click(Sender: TObject);
begin
frmBackup := TfrmBackup.Create(Self);
frmBackup.ShowModal;
try
finally
frmBackup.Free;
frmBackup := nil;
end;
end;

procedure TfrmPrincipal.ZerarEstoque1Click(Sender: TObject);
begin
  if MessageDlg('O estoque de todos os produtos ficaram zerados. Deseja Realmente zerar o estoque?',MtConfirmation,[mbyes,mbno],0)=mryes then
  begin
      frm_Produtos := Tfrm_Produtos.Create(Self);
      frm_Produtos.tbl_Produto.Active := true;
      frm_Produtos.tbl_Produto.First;
      while not frm_Produtos.tbl_Produto.Eof do
      begin
        frm_Produtos.tbl_Produto.edit;
        frm_Produtos.tbl_Produto.FieldByName('Qtd_Produto').Value := 0;
        frm_Produtos.tbl_Produto.Post;
        frm_Produtos.tbl_Produto.Next;
      end;
      frm_Produtos.tbl_Produto.Active := false;
      MessageDlg('Os produtos do seu estoque foi zerados com sucesso!',MtInformation,[mbok],0);
      frm_Produtos := nil;
    end;

end;

procedure TfrmPrincipal.btnMovimentacoesClick(Sender: TObject);
begin
frm_Movimentacao := Tfrm_Movimentacao.Create(Self);
frm_Movimentacao.ShowModal;
try
finally
frm_Movimentacao.Free;
frm_Movimentacao := nil;
end;
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;
end;

procedure TfrmPrincipal.btnDashboardClick(Sender: TObject);
begin
btnPagar.Visible := false;
btnReceber.Visible := false;
btnMovimentacoes.Visible := false;
btnDashboard.Visible := false;

frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;
try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.PagarReceber1Click(Sender: TObject);
begin

frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;
tabind := '0';

try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.DespesasReceita1Click(Sender: TObject);
begin
tabind := '1';
frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;

try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.VendanoPerodo1Click(Sender: TObject);
begin
tabind := '2';
frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;

try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.BalanoVendas1Click(Sender: TObject);
begin
tabind := '3';
frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;

try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
tabind := '4';
frm_Dashboard := Tfrm_Dashboard.Create(Self);
frm_Dashboard.ShowModal;

try
finally
frm_Dashboard.Free;
frm_Dashboard := nil;
end;
end;

procedure TfrmPrincipal.Ajustar1Click(Sender: TObject);
begin
frm_Ajustes :=Tfrm_Ajustes.Create(Self);
frm_Ajustes.ShowModal;
try
finally
frm_Ajustes.Free;
frm_Ajustes := nil;
end;
end;

procedure TfrmPrincipal.Backup;
begin
  aviso.Visible := TRUE;
  porcentagem.Visible := TRUE;
  ProgressBar1.Visible := true;
  ZipMaster1.ZipFileName:=ExtractFilePath(Application.ExeName)+'Dados\'+'Backup do '+nome+'.zip';
  ZipMaster1.FSpecArgs.Clear;
  Procura;
  ZipMaster1.Add;
  aviso.Visible := true;
  If ZipMaster1.SuccessCnt >= 1 then
  begin
    MessageDlg('Backup realizado com sucesso!', mtInformation, [mbOk],0)
  end;
 end;

procedure TfrmPrincipal.procura;
var
  Procurar : TSearchRec;
  Arquivos: Integer;
begin
  Arquivos := 0;
  Arquivos := Arquivos + faDirectory;
  Arquivos := Arquivos + faArchive;
  Arquivos := Arquivos + faAnyFile;

    if FindFirst(ExtractFilePath(Application.ExeName)+'\*.*', Arquivos, Procurar) = 0 then
    begin
      repeat
        if (Procurar.Attr and Arquivos) = Procurar.Attr then
          If ((Pos('.exe', Procurar.Name)=0) and (Pos('.HLP', Procurar.Name)=0)and
              (Pos('.cnt', Procurar.Name)=0) and (Pos('.dll', Procurar.Name)=0)and
              (Pos('.bin', Procurar.Name)=0)) Then
          Begin
        

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Ajustes.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Ajustes.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_VendTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_VendTotal.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Vendas.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Vendas.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Usuario.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Usuario.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Transferencia.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Transferencia.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Produto.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Produto.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Planos.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Planos.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PlanoContas.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PlanoContas.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PedTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_PedTotal.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Pedido.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Pedido.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Movimentacao.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Movimentacao.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Local.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Local.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Fornecedores.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Fornecedores.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasReceber.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasReceber.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasPagar.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasPagar.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasLancamento.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasLancamento.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasDetalhes.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContasDetalhes.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaCorrente.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaCorrente.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaBanco.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_ContaBanco.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_CompTotal.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_CompTotal.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Compras.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Compras.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cliente.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cliente.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cidade.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Cidade.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Bancos.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Bancos.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Baixa.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Baixa.PX');

              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.db');
              ZipMaster1.FSpecArgs.Add('C:\Projeto Horti-Frut\Dados\tbl_Avarias.PX');

              End;
      until FindNext(Procurar) <> 0;
      FindClose(Procurar);
    end;
end;


procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
begin
StatusBar1.Panels[0].Text := 'Seja bem vindo '+nome;
StatusBar1.Panels[1].Text := DateToStr(now);
StatusBar1.Panels[2].Text := FormatDateTime('hh:mm:ss',now);
StatusBar1.Panels[3].Text := nomecompleto;
end;

procedure TfrmPrincipal.Ajustar;
begin
frm_Ajustes := Tfrm_Ajustes.Create(self);
perc_venda := frm_Ajustes.Query1.FieldByName('Ajustes_Ajuste').Value;
frm_Ajustes.Query1.Next;
primeiro_planoconta := frm_Ajustes.Query1.FieldByName('Ajustes_Ajuste').Value;
frm_Ajustes.Query1.Next;
cc_debito := frm_Ajustes.Query1.FieldByName('Ajustes_Ajuste').Value;
frm_Ajustes.Query1.Next;
prazo_dias := frm_Ajustes.Query1.FieldByName('Ajustes_Ajuste').Value;
frm_Ajustes.Query1.Next;
cc_credito := frm_Ajustes.Query1.FieldByName('Ajustes_Ajuste').Value;
end;

procedure TfrmPrincipal.CarregarCor;
begin
  frm_Ajustes.FiltrarCor;
  Panel1.Color := cor;
  Panel2.Color := cor;
end;

procedure TfrmPrincipal.Ativos1Click(Sender: TObject);
begin
 form_entrada := 'Ativo';
 AbrirRelatorio('Usuarios');
end;

procedure TfrmPrincipal.Inativos1Click(Sender: TObject);
begin
  form_entrada := 'Inativo';
  AbrirRelatorio('Usuarios');
end;

procedure TfrmPrincipal.AbrirRelatorio(Nome: String):String;
begin
  relatorio := nome;
  try
    frmRelatorio_Pesquisa := TfrmRelatorio_Pesquisa.Create(self);
    frmRelatorio_Pesquisa.ShowModal;
  finally
    frmRelatorio_Pesquisa.Free;
    frmRelatorio_Pesquisa := nil;
  end;
end;
end;



end.

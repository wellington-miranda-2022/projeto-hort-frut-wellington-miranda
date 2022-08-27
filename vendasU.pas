unit vendasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables,
  ComCtrls, DateUtils, XPMan;

type
  Tfrm_Vendas = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Bevel3: TBevel;
    GBDados: TGroupBox;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    ds_Vendas: TDataSource;
    tbl_Vendas: TTable;
    tbl_VendasCod_Venda: TIntegerField;
    tbl_VendasProduto_Venda: TStringField;
    tbl_VendasValor_Venda: TFloatField;
    tbl_VendasTotal_Venda: TFloatField;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    editCod: TDBEdit;
    Label2: TLabel;
    editProduto: TDBEdit;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    ds_Produtos: TDataSource;
    ds_Clientes: TDataSource;
    tbl_Produtos: TTable;
    tbl_Clientes: TTable;
    tbl_ProdutosCod_Produto: TIntegerField;
    tbl_ProdutosDescricao_Produto: TStringField;
    tbl_ProdutosTipo_Produto: TStringField;
    tbl_ProdutosFornecedores_Produto: TStringField;
    tbl_VendasCliente_Venda: TStringField;
    editQTD: TDBEdit;
    SpeedButton1: TSpeedButton;
    XPManifest1: TXPManifest;
    cbCliente: TDBComboBox;
    btnVoltar: TSpeedButton;
    Image1: TImage;
    tbl_VendasCod_VendTotal: TIntegerField;
    Label14: TLabel;
    editIdVenda: TDBEdit;
    tbl_VendTotal: TTable;
    ds_VendTotal: TDataSource;
    lblTotal: TLabel;
    editValor: TDBEdit;
    tbl_VendasQtd_Venda: TFloatField;
    tbl_ProdutosQtd_Produto: TFloatField;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbClienteChange(Sender: TObject);
    procedure editValorExit(Sender: TObject);
    procedure editQTDExit(Sender: TObject);
    procedure btntesteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CARREGARCLIENTES;
    procedure SubtrairQuantidade;
    procedure tratabotoes;
    procedure botoesnormais;
    procedure SomarValores;
    procedure LIMPAVARIAVEIS;
    procedure GravarMais;
    procedure VerificarEstoque;
    procedure ATUALIZAR;

  public
  x : Integer;
  rs : Real;
   end;

var
  frm_Vendas: Tfrm_Vendas;
  edit : Integer;
  cod : Integer;
 
  
implementation


uses principalU, loginU, buscarprodutovendaU, novopedU, buscarprodutoU,
  cidadesU, listapedU, listavenddetalhes, ajustesU;

{$R *.dfm}

procedure Tfrm_Vendas.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
edit := 2;
tratabotoes();
tbl_Clientes.Active := true;
tbl_Vendas.Active := true;
tbl_Vendas.Last;
cbCliente.Text := 'ESCOLHA O CLIENTE DESEJADO';
CARREGARCLIENTES;
prox := tbl_Vendas.FieldByName('Cod_Venda').AsInteger + 1;
tbl_Vendas.Append;
tbl_Vendas.FieldByName('Cod_Venda').AsInteger := prox;
editQTD.Text := '0';
editValor.Text := '0';

end;

procedure Tfrm_Vendas.FormShow(Sender: TObject);
begin

 Panel1.Color := cor;
  Panel2.Color := cor - 30;
  

tbl_VendTotal.Active := true;

cbCliente.Text := listcliente;
editProduto.Text := produto;

if (cbCliente.Text = '')or(cbCliente.Text = listcliente) then
begin
cbCliente.Text := listcliente;
end;
end;


procedure Tfrm_Vendas.btnGravarClick(Sender: TObject);
var
id_venda : Integer;
cobranca: Integer;
edittotal : String;
begin

if (editQTD.Text = '0')or(editValor.Text = '0')or(editProduto.Text = '')or(cbCliente.Text = 'ESCOLHA O CLIENTE DESEJADO')then
begin
MessageDlg('Coloque os valores nos campos!',MtWarning,[mbok],0);
exit;
end;

if (editQTD.Text = '')or(editValor.Text = '')or(cbCliente.Text = '') then
begin
MessageDlg('Campos vazios! Verifique!',MtWarning,[mbok],0);
exit;
end;
frm_ListaVendaDetalhes.tbl_VendTotal.Filtered := false;
VerificarEstoque;

if x < 0 then
begin
MessageDlg('N�o a quantidade suficiente de '+Produto+' no estoque!',MtWarning,[mbok],0);
exit;
end;

if edit = 2 then
begin

listqtd := editQtd.Text;

tbl_Vendas.Active := true;
tbl_Vendas.Edit;
tbl_Vendas.FieldByName('Total_Venda').Value := rs;
tbl_Vendas.FieldByName('Valor_Venda').Value := StrToFloat(editValor.Text);
tbl_Vendas.Post;
Close;
frm_ListaVendaDetalhes.Hide;
frm_ListaVendaDetalhes.Show;
exit;
end;

if inserirqtd = 5 then
begin
GravarMais;
edit := 2;
exit;
end;

if cbCliente.Enabled = true then
begin
tbl_VendTotal.Active:= true;
tbl_VendTotal.Last;
id_venda := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger + 1;
tbl_Vendas.Edit;
tbl_Vendas.FieldByName('Cliente_Venda').AsString := cbCliente.Text;
tbl_Vendas.FieldByName('Cod_VendTotal').Value := id_venda;
tbl_Vendas.FieldByName('Valor_Venda').Value := StrToFloat(editValor.Text);
tbl_Vendas.FieldByName('Total_Venda').Value := rs;

tratabotoes;
tbl_Vendas.Post;
Close;
edit := 0;
listcliente := cbCliente.Text;
frm_ListaVendaDetalhes.Hide;
frm_ListaVendaDetalhes.Show;
exit;
end;

end;


procedure Tfrm_Vendas.CARREGARCLIENTES;
begin
if cbCliente.Text = 'ESCOLHA O CLIENTE DESEJADO' then
begin
cbCliente.Clear;
With tbl_Clientes do
  begin

    Active := False;
    Active := True;

    if not isEmpty then
      while not Eof do
        begin
          cbCliente.Items.Add(FieldByName('Nome_Cliente').AsString);
          Next;
        end;
  end;
end;
end;

procedure Tfrm_Vendas.SpeedButton1Click(Sender: TObject);
begin
frm_BuscarProdutoVenda := Tfrm_BuscarProdutoVenda.Create(self);
frm_BuscarProdutoVenda.ShowModal;

try
finally
frm_BuscarProdutoVenda.Free;
frm_BuscarProdutoVenda := nil;
end;
end;

procedure Tfrm_Vendas.FormCreate(Sender: TObject);
var
prox : Integer;
begin
if edit = 2 then
begin
botoesnormais;
tbl_Vendas.Active := true;
tbl_Clientes.Active := true;
CARREGARCLIENTES;
tbl_Vendas.Edit;
btnNovo.Enabled := false;
tbl_Vendas.Locate('Cod_Venda',IntToStr(cod),[]);
cbCliente.Text := listcliente;
cbCliente.Enabled := false;
end; 
// habilita os botoes
if frm_ListaPedido = nil then
begin
btnVoltar.Enabled := false;
end else
btnVoltar.Enabled := true;
//
if edit = 1 then
begin
botoesnormais;
tbl_Vendas.Active := true;
tbl_Clientes.Active := true;
end;
if listcliente = '' then
begin
cbCliente.Text := 'ESCOLHA O CLIENTE DESEJADO';
end;
if cbCliente.Text <> 'ESCOLHA O CLIENTE DESEJADO' then
begin
cbCliente.Text := listcliente;
end;
CARREGARCLIENTES;
tbl_Vendas.Last;
prox := tbl_Vendas.FieldByName('Cod_Venda').AsInteger + 1;
tbl_Vendas.Append;
tbl_Vendas.FieldByName('Cod_Venda').AsInteger := prox;
btnNovo.Enabled := false;
editQTD.Text := '0';
editValor.Text := '0';
end;


procedure Tfrm_Vendas.SpeedButton2Click(Sender: TObject);
begin
inserirqtd := 1;
frm_Cidades := Tfrm_Cidades.Create(Self);
frm_Cidades.ShowModal;
try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure Tfrm_Vendas.SubtrairQuantidade;
var
menosqtd,qtdtotal : Integer;
fruta : String;
begin
qtdtotal := StrToInt(editQtd.Text);
tbl_Produtos.Active := true;
tbl_Produtos.Filtered := true;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(editProduto.Text+'*');
menosqtd := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger;
fruta := tbl_Produtos.FieldByName('Descricao_Produto').AsString;
x := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger - qtdtotal;
if x <= 0 then
begin
MessageDlg('N�o � quantidade suficiente de '+fruta+' no estoque!',MtInformation,[mbok],0);
exit;
end else
tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := x;
tbl_Produtos.Post;

end;

procedure Tfrm_Vendas.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_Vendas.btnEditarClick(Sender: TObject);
begin
DBNavigator1.Enabled := true;
tbl_Clientes.Active := true;
tbl_Vendas.Close;
tbl_vendas.Active := true;
cbCliente.Text := 'ESCOLHA O CLIENTE DESEJADO';
CARREGARCLIENTES;
edit := 1;
if messageDlg('Deseja fazer edi��o no registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
  then
  tbl_Vendas.Active := true;
if tbl_Vendas.FieldByName('Cod_Venda').AsInteger = 0
  then
    begin
    MessageDlg('Banco de dados v�zios. Crie um novo registro clicando no bot�o "NOVO"',MtInformation,[mbyes],0);
    tbl_Vendas.Active := false;
    exit;
end else
tratabotoes;
tbl_Vendas.Active := true;
tbl_Vendas.Last;
tbl_Vendas.Edit;
cbCliente.SetFocus;
cbCliente.SelectAll;
end;

procedure Tfrm_Vendas.btnCancelarClick(Sender: TObject);
begin
tbl_Vendas.Active := false;
tratabotoes;
edit := 0;
produto := '';
totalprevfrete := 0;
listcliente := '';
listvalor := '';
listqtd := '';
listtotal := '';
end;

procedure Tfrm_Vendas.SomarValores;
var
qtd : Integer;
total, valor : Real;
begin

  qtd := StrToInt(editQTD.Text);
  valor := StrToFloat(editValor.Text);

  total := (valor * qtd);

  lblTotal.Caption := FormatFloat('R$ #,,,,0.00',total);
  rs := total;

end;

procedure Tfrm_Vendas.botoesnormais;
begin
btnNovo.Enabled := false;
btnEditar.Enabled := false;
btnDeletar.Enabled := true;
btnGravar.Enabled := true;
btnCancelar.Enabled := true;


end;

procedure Tfrm_Vendas.btnDeletarClick(Sender: TObject);
begin
if tbl_Vendas.RecordCount = 0 then
begin
MessageDlg('Banco de dados vazio. N�o a registros a serem deletados!',MtWarning,[mbok],0);
end else
    if MessageDlg('Deseja realmente delatar esse dado no registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
   begin
    tbl_Vendas.Delete;
    MessageDlg('Registro deletado com sucesso!',MtInformation,[mbok],0);
    end else
    abort;
end;

procedure Tfrm_Vendas.btnVoltarClick(Sender: TObject);
begin
LIMPAVARIAVEIS;
Close;
frm_ListaPedido.Show;
end;

procedure Tfrm_Vendas.LIMPAVARIAVEIS;
begin
produto := '';
totalprevfrete := 0;
listcliente := '';
listvalor := '';
listqtd := '';
listtotal := '';
x := 0;
end;

procedure Tfrm_Vendas.BitBtn1Click(Sender: TObject);
begin
Self.Close;
tbl_Vendas.Cancel;
produto := '';
listcliente :='ESCOLHA O CLIENTE DESEJADO';

end;

procedure Tfrm_Vendas.cbClienteChange(Sender: TObject);
begin
listcliente := cbCliente.Text;
end;

procedure Tfrm_Vendas.GravarMais;
var
id_venda : Integer;
begin
tbl_VendTotal.Active:= true;
tbl_VendTotal.Last;
id_venda := tbl_VendTotal.FieldByName('CodVendTotal').AsInteger;
tbl_Vendas.Edit;
tbl_Vendas.FieldByName('Cliente_Venda').AsString := cbCliente.Text;
tbl_Vendas.FieldByName('Cod_VendTotal').Value := id_venda;
tratabotoes;
tbl_Vendas.Post;
Close;
frm_ListaVendaDetalhes.Hide;
frm_ListaVendaDetalhes.Show;
end;

procedure Tfrm_Vendas.editValorExit(Sender: TObject);
begin
if (editValor.Text = '')then
begin
editValor.Text := '0';
end;
SomarValores;
end;

procedure Tfrm_Vendas.VerificarEstoque;
var
qtdvenda : Integer;
estoque : Integer;
begin
tbl_Produtos.Active := true;
if editProduto.Text <> '' then
begin
produto := editProduto.Text;
end;
tbl_Produtos.Filtered := false;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(produto);
tbl_Produtos.Filtered := true;



qtdvenda := StrToInt(editQtd.Text);
x :=  tbl_Produtos.FieldByName('Qtd_Produto').AsInteger - qtdvenda;




end;

procedure Tfrm_Vendas.ATUALIZAR;
var
edittotal : String;
begin
tbl_Vendas.FieldByName('Total_Venda').Value := rs;
tbl_Vendas.Post;
Close;
frm_ListaVendaDetalhes.Hide;
frm_ListaVendaDetalhes.Show;
end;

procedure Tfrm_Vendas.editQTDExit(Sender: TObject);
begin
if editQtd.Text = '' then
begin
editQtd.Text := '0';
end;
end;

procedure Tfrm_Vendas.btntesteClick(Sender: TObject);
begin
tbl_Vendas.FieldByName('Total_Venda').Value := rs;
tbl_Vendas.Post;


end;

procedure Tfrm_Vendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

end.

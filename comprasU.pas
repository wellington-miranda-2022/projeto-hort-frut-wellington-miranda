unit comprasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ComCtrls, Mask, ExtCtrls, Buttons, DB,
  DBTables, DateUtils;

type
  Tfrm_Compras = class(TForm)
    Panel1: TPanel;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    GBDados: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    btnAdicionar: TSpeedButton;
    Image1: TImage;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    editCod: TDBEdit;
    editProduto: TDBEdit;
    editTotal: TDBEdit;
    ds_Produtos: TDataSource;
    tbl_Produtos: TTable;
    tbl_ProdutosCod_Produto: TIntegerField;
    tbl_ProdutosDescricao_Produto: TStringField;
    tbl_ProdutosTipo_Produto: TStringField;
    tbl_ProdutosFornecedores_Produto: TStringField;
    Label3: TLabel;
    tbl_Compras: TTable;
    ds_Compras: TDataSource;
    cbTipo: TComboBox;
    tbl_ComprasCod_Compra: TIntegerField;
    tbl_ComprasCod_CompTotal: TIntegerField;
    tbl_ComprasProduto_Compra: TStringField;
    tbl_ComprasUnid_Compra: TStringField;
    tbl_ComprasValor_Compra: TCurrencyField;
    tbl_ComprasTotal_Compra: TCurrencyField;
    editValor: TDBEdit;
    editQuantidade: TDBEdit;
    Label4: TLabel;
    editCodCompTotal: TDBEdit;
    tbl_CompTotal: TTable;
    tbl_ProdutosQtd_Produto: TFloatField;
    tbl_ComprasQuantidade_Compra: TFloatField;
    procedure btnAdicionarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFreteClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnListaPedidoClick(Sender: TObject);
    procedure editPrazoKeyPress(Sender: TObject; var Key: Char);
    procedure editValorExit(Sender: TObject);
    procedure editQuantidadeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editQuantidadeEnter(Sender: TObject);
    procedure editValorEnter(Sender: TObject);

    private
    procedure PREPARANDOFORMULARIO;
    procedure HABILITARBOTOES;
    procedure TRATABOTOES;
    procedure ATUALIZAR;

    procedure SOMARVALORES;
    procedure SOMARQUANTIDADES;
    procedure LIMPARVARIAVEIS;
    procedure GerarID;
    procedure ADICIONAR;
    procedure GravarMais;

     public
  x :  Integer;
  rs : Real;
  end;

var
  frm_Compras: Tfrm_Compras;

implementation

uses buscarprodutoU, principalU, loginU, novopedU, prevfreteU, cidadesU,
  listapedU, listavenddetalhes, listacompdetalhesU, vendasU, ajustesU;

{$R *.dfm}

procedure Tfrm_Compras.btnAdicionarClick(Sender: TObject);
begin
if inserirqtd <> 5 then
begin
inserirqtd := 3;
end;
frm_BuscarProduto := Tfrm_BuscarProduto.Create(self);
frm_BuscarProduto.ShowModal;
try
finally
frm_BuscarProduto.Free;
frm_BuscarProduto := nil;
end;
end;

procedure Tfrm_Compras.BitBtn1Click(Sender: TObject);
begin
Self.Close;
LIMPARVARIAVEIS;
end;


procedure Tfrm_Compras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_Compras.FormShow(Sender: TObject);
var
prox : Integer;
begin
  Panel1.Color := cor;
  Panel2.Color := cor - 30;

PREPARANDOFORMULARIO;

end;

procedure Tfrm_Compras.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
if MessageDlg('Deseja abrir uma nova compra?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin

tbl_Compras.Active := true;
tbl_Compras.Last;
prox := tbl_Compras.FieldByName('Cod_Compra').AsInteger + 1;
tbl_Compras.Append;
GerarID;
tbl_Compras.FieldByName('Cod_Compra').AsInteger := prox;

HABILITARBOTOES;
PREPARANDOFORMULARIO;
TRATABOTOES;
end else
abort;
end;

procedure Tfrm_Compras.btnEditarClick(Sender: TObject);
begin
edit := 1;
if MessageDlg('Deseja realmente editar o registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Compras.Active := true;
if tbl_Compras.RecordCount = 0 then
begin
MessageDlg('N�o a registros no banco de dados a serem editados!',MtWarning,[mbok],0);
end else
tbl_Compras.Edit;
HABILITARBOTOES;
TRATABOTOES;
DBNavigator1.Enabled := true;
end else
abort;
end;

procedure Tfrm_Compras.PREPARANDOFORMULARIO;
begin
editProduto.Text := produto;
end;

procedure Tfrm_Compras.HABILITARBOTOES;
begin
btnAdicionar.Enabled := true;
cbTipo.Enabled := true;


end;


procedure Tfrm_Compras.btnGravarClick(Sender: TObject);
begin
if (editQuantidade.Text = '')then
begin
MessageDlg('Campos Vazios, Verifique!',MtWarning,[mbok],0);
exit
end;

frm_ListaCompDetalhes.tbl_CompTotal.Filtered := false;
SOMARVALORES;
if edit = 2 then
begin
listqtd := editQuantidade.Text;
end;

if inserirqtd = 5 then
begin
GravarMais;
edit := 2;
exit;
end;

if edit = 2 then
begin
ATUALIZAR;
exit;
end;
if x >=0 then
begin
TRATABOTOES;
tbl_Compras.Edit;
tbl_Compras.FieldByName('Total_Compra').Value := rs;
tbl_Compras.FieldByName('Unid_Compra').Value := cbTipo.Text;
edit := 0;
tratabotoes;
tbl_Compras.Post;
Close;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;
end;
end;

procedure Tfrm_Compras.TRATABOTOES;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;



procedure Tfrm_Compras.SOMARVALORES;
var
qtd : Integer;
total, valor : Real;
begin
  qtd := StrToInt(editQuantidade.Text);
  valor := StrTofloat(editValor.Text);

  total := valor * qtd;

  editTotal.Text := FormatFloat('R$ #,,,,0.00',total);
  rs := total;

end;

procedure Tfrm_Compras.btnFreteClick(Sender: TObject);
begin
inserirqtd := 2;
frm_Cidades := Tfrm_Cidades.Create(self);
frm_Cidades.ShowModal;
try
finally
frm_Cidades.Free;
frm_Cidades := nil;
end;
end;

procedure Tfrm_Compras.SOMARQUANTIDADES;
var
menosqtd,qtdtotal : Integer;
fruta : String;
begin
qtdtotal := StrToInt(editQuantidade.Text);
tbl_Produtos.Active := true;
tbl_Produtos.Filtered := true;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(editProduto.Text+'*');
menosqtd := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger;
fruta := tbl_Produtos.FieldByName('Descricao_Produto').AsString;
x := tbl_Produtos.FieldByName('Qtd_Produto').AsInteger + qtdtotal;

tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := x;
tbl_Produtos.Post;

end;

procedure Tfrm_Compras.LIMPARVARIAVEIS;
begin
x := 0;
produto := '';
totalprevfrete := 0;
edit := 0;
inserirqtd := 0;
end;

procedure Tfrm_Compras.btnDeletarClick(Sender: TObject);
begin
if tbl_Compras.RecordCount = 0 then
begin
MessageDlg('N�o a registros a serem deletados!',MtWarning,[mbok],0);
exit;
end;
if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Compras.Delete;
MessageDlg('Registro deletado como sucesso!',MtInformation,[mbok],0);
TRATABOTOES;
end;
end;

procedure Tfrm_Compras.btnCancelarClick(Sender: TObject);
begin
tbl_Compras.Cancel;
tbl_Compras.Active := false;
LIMPARVARIAVEIS;
TRATABOTOES;
end;

procedure Tfrm_Compras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Compras.Active := false ;
tbl_Produtos.Active := false;
end;

procedure Tfrm_Compras.btnListaPedidoClick(Sender: TObject);
begin
inserirqtd := 2;
frm_ListaPedido := Tfrm_ListaPedido.Create(self);
frm_ListaPedido.ShowModal;
try
finally
frm_ListaPedido.Free;
frm_ListaPedido := nil;
end;
end;

procedure Tfrm_Compras.editPrazoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
begin
  Key := #0;
end;
end;

procedure Tfrm_Compras.editValorExit(Sender: TObject);
begin
editValor.Color := clWhite;
if (editValor.Text <> '')or(editValor.Text  <> '') then
begin
SomarValores;
end;
end;

procedure Tfrm_Compras.editQuantidadeExit(Sender: TObject);
begin
editQuantidade.Color := clWhite;
if editQuantidade.Text <> '' then
begin
listqtd := editQuantidade.Text;
end;
end;

procedure Tfrm_Compras.GerarID;
var
codigo: Integer;
begin
tbl_CompTotal.Active := true;
tbl_Compras.Active := true;
tbl_CompTotal.Last;
codigo := tbl_CompTotal.FieldByName('Cod_CompTotal').AsInteger + 1;
tbl_Compras.FieldByName('Cod_CompTotal').AsInteger := codigo;


end;

procedure Tfrm_Compras.FormCreate(Sender: TObject);
var
prox : Integer;
begin
if edit = 1 then
begin
ADICIONAR;
end;
if edit = 2 then
begin
tbl_Compras.Active := true;
tbl_Compras.Edit;
btnNovo.Enabled := false;
btnAdicionar.Enabled := true;
tbl_Compras.Locate('Cod_Compra',IntToStr(cod),[]);
btnEditar.Enabled := false;
btnGravar.Enabled := true;
SOMARVALORES;
end;

end;

procedure Tfrm_Compras.ADICIONAR;
var
prox : Integer;
begin
tbl_Compras.Active := true;
tbl_Compras.Last;
prox := tbl_Compras.FieldByName('Cod_Compra').AsInteger + 1;
tbl_Compras.Append;
GerarID;
tbl_Compras.FieldByName('Cod_Compra').AsInteger := prox;

editQuantidade.Text := '0';
editValor.Text := '0';
btnAdicionar.Enabled := true;
TRATABOTOES;
end;

procedure Tfrm_Compras.ATUALIZAR;
begin
TRATABOTOES;
tbl_Compras.Edit;
tbl_Compras.FieldByName('Total_Compra').Value := rs;
tbl_Compras.FieldByName('Unid_Compra').Value := cbTipo.Text;
tratabotoes;
tbl_Compras.Post;
Close;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;
end;

procedure Tfrm_Compras.GravarMais;
begin
tbl_CompTotal.Active:= true;
tbl_Compras.FieldByName('Cod_CompTotal').Value := inicio;
tbl_Compras.Edit;
tbl_Compras.FieldByName('Total_Compra').Value := editTotal.Text; 
SomarValores;
tratabotoes;
tbl_Compras.Post;
Close;
frm_ListaCompDetalhes.Hide;
frm_ListaCompDetalhes.Show;
end;





procedure Tfrm_Compras.editQuantidadeEnter(Sender: TObject);
begin
editQuantidade.Color := clSkyBlue;
end;

procedure Tfrm_Compras.editValorEnter(Sender: TObject);
begin
editValor.Color := clSkyBlue;
end;

end.


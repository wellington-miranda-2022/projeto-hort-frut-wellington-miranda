unit avariaU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, DB, DBTables, Spin, Buttons,
  ExtCtrls;

type
  Tfrm_Avaria = class(TForm)
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    GBFiltro: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Bevel3: TBevel;
    btnInserir: TSpeedButton;
    btnProcurar: TSpeedButton;
    Bevel5: TBevel;
    editProduto: TEdit;
    editQTD: TSpinEdit;
    tbl_Avarias: TTable;
    Panel3: TPanel;
    btnDeletar: TBitBtn;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    DBAvaria: TDBGrid;
    DBNavigator1: TDBNavigator;
    ds_Avaria: TDataSource;
    tbl_AvariasCod_Avaria: TIntegerField;
    tbl_AvariasProduto_Avaria: TStringField;
    tbl_AvariasQuantidade_Avaria: TIntegerField;
    tbl_AvariasObs_Avaria: TStringField;
    GroupBox3: TGroupBox;
    Memo2: TMemo;
    tbl_AvariasData_Avaria: TDateField;
    tbl_Produtos: TTable;
    tbl_ProdutosCod_Produto: TIntegerField;
    tbl_ProdutosDescricao_Produto: TStringField;
    tbl_ProdutosTipo_Produto: TStringField;
    tbl_ProdutosQtd_Produto: TIntegerField;
    tbl_ProdutosFornecedores_Produto: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBAvariaCellClick(Column: TColumn);
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAvariaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure editProdutoEnter(Sender: TObject);
    procedure editProdutoExit(Sender: TObject);
    procedure editQTDExit(Sender: TObject);
    procedure editQTDEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure AssociarCampos;
    procedure BuscarObservacao;
    procedure Incrementacao;
    procedure LimparCampos;
    procedure DescontarEstoque;

  public
    x : Integer;
  end;

var
  frm_Avaria: Tfrm_Avaria;

implementation

uses buscarprodutoU, insertqtdU, principalU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Avaria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
tbl_Avarias.Active := false;
tbl_Produtos.Active := false;
end;

procedure Tfrm_Avaria.BitBtn1Click(Sender: TObject);
begin
Self.Close;
tbl_Avarias.Cancel;
end;

procedure Tfrm_Avaria.btnNovoClick(Sender: TObject);
begin
Incrementacao;
editProduto.SetFocus;
end;

procedure Tfrm_Avaria.btnGravarClick(Sender: TObject);
begin
if (editProduto.Text = '')or(Memo1.Text = '') then
begin
MessageDlg('Campos v�zios, por favor verifique!',MtWarning,[mbok],0);
end else
tbl_Avarias.Edit;
AssociarCampos;
tbl_Avarias.Post;
end;

procedure Tfrm_Avaria.btnDeletarClick(Sender: TObject);
begin
if tbl_Avarias.RecordCount > 0 then
begin

if MessageDlg('Deseja realmente deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Avarias.Delete;
end else
abort;
end else
MessageDlg('N�o a registros a para serem deletados!',MtError,[mbok],0);
DBNavigator1.Enabled := false;

end;

procedure Tfrm_Avaria.btnProcurarClick(Sender: TObject);
begin
inserirqtd := 7;
frm_BuscarProduto := Tfrm_BuscarProduto.Create(Self);
frm_BuscarProduto.ShowModal;
try
finally
frm_BuscarProduto.Free;
frm_BuscarProduto := nil;
end;
end;

procedure Tfrm_Avaria.btnInserirClick(Sender: TObject);
begin
if tbl_Avarias.RecordCount > 0 then
begin
DBNavigator1.Enabled := true;
end;

if (editProduto.Text = '')or(Trim(Memo1.Text) = '') then
begin
MessageDlg('Campos v�zios, verifique!',MtWarning,[mbok],0);
exit;
end;


DescontarEstoque;
if x > 0 then
begin
Incrementacao;
AssociarCampos;
end;
LimparCampos;
end;

procedure Tfrm_Avaria.SpeedButton1Click(Sender: TObject);
begin
BuscarObservacao;
end;

procedure Tfrm_Avaria.AssociarCampos;
begin
tbl_Avarias.FieldByName('Produto_Avaria').Value := editProduto.Text;
tbl_Avarias.FieldByName('Quantidade_Avaria').Value := StrToInt(editQtd.Text);
tbl_Avarias.FieldByName('Obs_Avaria').Value := Memo1.Text;
tbl_Avarias.FieldByName('Data_Avaria').Value := date;
tbl_Avarias.Post;
end;

procedure Tfrm_Avaria.FormCreate(Sender: TObject);
begin
tbl_Avarias.Active := true;

end;

procedure Tfrm_Avaria.BuscarObservacao;
begin
Memo2.Text := tbl_Avarias.FieldByName('Obs_Avaria').AsString;
end;

procedure Tfrm_Avaria.Incrementacao;
var
prox : Integer;
begin
tbl_Avarias.Last;
prox := tbl_Avarias.FieldByName('Cod_Avaria').AsInteger + 1;
tbl_Avarias.Append;
tbl_Avarias.FieldByName('Cod_Avaria').AsInteger := prox;

end;

procedure Tfrm_Avaria.LimparCampos;
begin
editProduto.Clear;
editQtd.Clear;
Memo1.Clear;
editProduto.SetFocus
end;

procedure Tfrm_Avaria.DBAvariaCellClick(Column: TColumn);
begin
BuscarObservacao;
end;

procedure Tfrm_Avaria.Memo1Enter(Sender: TObject);
begin
Memo1.Color := $00FEFEC5;
end;

procedure Tfrm_Avaria.Memo1Exit(Sender: TObject);
begin
Memo1.Color := clWhite;
end;

procedure Tfrm_Avaria.DescontarEstoque;
var
estoque, qtdavaria, resultado : Integer;
begin
produto := editProduto.Text;

tbl_Produtos.Active := false;
tbl_Produtos.Active := true;
tbl_Produtos.Filtered := false;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(produto);
tbl_Produtos.Filtered := true;
if tbl_Produtos.FieldByName('Qtd_Produto').Value <1 then
begin
MessageDlg('Quantidade inexistente no estoque, confira!',MtWarning,[mbok],0);
exit;
end;

estoque := tbl_Produtos.FieldByName('Qtd_Produto').Value;
qtdavaria := StrtoInt(editQtd.Text);
resultado := estoque - qtdavaria;
x := resultado;

if resultado < 0 then
begin
MessageDlg('Quantidade inexistente no estoque, confira!',MtWarning,[mbok],0);
exit;
end else
tbl_Produtos.Edit;
tbl_Produtos.FieldByName('Qtd_Produto').Value := resultado;
tbl_Produtos.Post;

end;

procedure Tfrm_Avaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_Avaria.DBAvariaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(DBAvaria.DataSource.Dataset.RecNo)then
begin
DBAvaria.Canvas.Brush.Color := $00E9E9E9;
end else
DBAvaria.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
DBAvaria.Canvas.Brush.Color := clHighlight;
DBAvaria.Canvas.Font.Color := clWhite;
DBAvaria.Canvas.Font.Style := [fsBold];
end;
DBAvaria.Canvas.FillRect(Rect);
DBAvaria.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_Avaria.editProdutoEnter(Sender: TObject);
begin
editProduto.Color := clSkyBlue;
end;

procedure Tfrm_Avaria.editProdutoExit(Sender: TObject);
begin
editProduto.Color := clWhite;
end;

procedure Tfrm_Avaria.editQTDExit(Sender: TObject);
begin
editQTD.Color := clWhite;
end;

procedure Tfrm_Avaria.editQTDEnter(Sender: TObject);
begin
editQTD.Color := clSkyBlue;
end;

procedure Tfrm_Avaria.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor;
  Panel3.Color := cor - 50;
 end;

end.

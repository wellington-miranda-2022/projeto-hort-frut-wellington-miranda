unit produtosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables, Grids,
  DBGrids, XPMan;

type
  Tfrm_Produtos = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    ds_Produto: TDataSource;
    tbl_Produto: TTable;
    tbl_ProdutoCod_Produto: TIntegerField;
    tbl_ProdutoDescricao_Produto: TStringField;
    tbl_ProdutoTipo_Produto: TStringField;
    Label2: TLabel;
    editDescricao: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    editQuantidade: TDBEdit;
    tbl_Fornecedores: TTable;
    ds_Fornecedores: TDataSource;
    tbl_FornecedoresCod_Fornecedores: TIntegerField;
    tbl_FornecedoresNome_Fornecedores: TStringField;
    tbl_FornecedoresCNPJ_Fornecedores: TStringField;
    tbl_FornecedoresTelefone_Fornecedores: TStringField;
    tbl_FornecedoresBairro_Fornecedores: TStringField;
    tbl_FornecedoresEndereco_Fornecedores: TStringField;
    tbl_FornecedoresMunicipio_Fornecedores: TStringField;
    tbl_FornecedoresCep_Fornecedores: TStringField;
    Label5: TLabel;
    tbl_ProdutoFornecedores_Produto: TStringField;
    tbl_ProdutoFornecedores: TStringField;
    cbFornecedor: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    idFiltro: TLabel;
    dbDados: TDBGrid;
    XPManifest1: TXPManifest;
    tbl_ProdutoQtd_Produto: TFloatField;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    cbTipo: TComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure tratabotoes();
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure editConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure dbDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure editDescricaoEnter(Sender: TObject);
    procedure editQuantidadeEnter(Sender: TObject);
    procedure cbFornecedorEnter(Sender: TObject);
    procedure cbTipoEnter(Sender: TObject);
    procedure editDescricaoExit(Sender: TObject);
    procedure editQuantidadeExit(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbDadosDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbDadosCellClick(Column: TColumn);
 
  private
    { Private declarations }
  public


  end;

var
  frm_Produtos: Tfrm_Produtos;
  dadosfiltro : String;

implementation

uses buscarprodutoU, consultaprodutosU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Produtos.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin

  if MessageDlg('Deseja criar um novo registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
  begin
dbDados.Enabled := true;
tbl_Produto.Active := true;
tbl_Produto.Last;
prox := tbl_Produto.FieldByName('Cod_Produto').AsInteger + 1;
tbl_Produto.Append;
tbl_Produto.FieldByName('Cod_Produto').AsInteger := prox;
editDescricao.SetFocus;
tbl_Fornecedores.Active := true;

//filtro
idFiltro.Caption := dbDados.Columns[0].Title.Caption;
tratabotoes();
   end else
  abort;
end;

procedure Tfrm_Produtos.btnSairClick(Sender: TObject);
begin
tbl_Produto.Cancel;
close;
end;

procedure Tfrm_Produtos.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnDeletar.Enabled;
btnGravar.Enabled := not btnGravar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_Produtos.btnCancelarClick(Sender: TObject);
begin
tbl_Produto.Cancel;
tbl_Produto.Active := false;
tbl_Produto.Filtered := false;
dbDados.Enabled := false;

tratabotoes();
end;

procedure Tfrm_Produtos.btnDeletarClick(Sender: TObject);
begin
if tbl_Produto.FieldByName('Cod_Produto').AsInteger = 0
then
  begin
    MessageDlg('N�o existe registros a serem excluidos!',MtInformation,[mbyes,mbno],0);

exit;
end;
if messageDlg('Deseja excluir esse registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
  then
    begin
      tbl_Produto.Delete;
      tratabotoes();
      showmessage('Registro deletado com sucesso!');
end;
end;

procedure Tfrm_Produtos.btnEditarClick(Sender: TObject);
begin
tbl_Produto.Active := true;
if tbl_Produto.RecordCount = 0 then
begin
MessageDlg('N�o a registros no banco de dados, por favor clique em "Novo"',MtInformation,[mbyes],0);
tbl_Produto.Active := false;
end else
if messageDlg('Deseja realmente editar o registro?',MtConfirmation,[mbyes,mbno],0)=mryes
  then
    begin
      dbDados.Enabled := true;
      tbl_Produto.Active := true;
      tbl_Produto.Edit;
      editDescricao.SetFocus;
      dbDados.Enabled := true;
      tratabotoes;
      cbTipo.Text := tbl_Produto.FieldByName('Tipo_Produto').AsString;
end else
tbl_Produto.Active := false;
abort;


if tbl_Produto.FieldByName('Cod_Produto').AsInteger = 0 then
begin
  ShowMessage('Registro inexistente, crie um novo registro clicando em "Novo"');
end;
end;
procedure Tfrm_Produtos.btnGravarClick(Sender: TObject);
begin
messageDlg('Registro salvo com sucesso!',MtInformation,[mbyes],0);
      tbl_Produto.Edit;
      tbl_Produto.Post;
      tratabotoes();
end;

procedure Tfrm_Produtos.FormShow(Sender: TObject);
begin

 Panel1.Color := cor;
  Panel2.Color := cor;
  GroupBox1.Color := cor - 30;


DBDados.Columns[0].Title.alignment := taCenter;
DBDados.Columns[1].Title.alignment := taCenter;
DBDados.Columns[2].Title.alignment := taCenter;
DBDados.Columns[3].Title.alignment := taCenter;
DBDados.Columns[4].Title.alignment := taCenter;
idFiltro.Caption := dbDados.Columns[0].Title.Caption+':';
dadosfiltro := dbDados.Columns[0].FieldName;
tbl_Produto.Filtered := false;
end;

procedure Tfrm_Produtos.dbDadosTitleClick(Column: TColumn);
begin
idFiltro.Caption := Column.Title.Caption+':';
dadosfiltro := Column.FieldName;
tbl_Produto.Filtered := false;
end;

procedure Tfrm_Produtos.editConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (idFiltro.Caption = 'C�digo:')or(idFiltro.Caption = 'QTD:') then
  begin
if not (Key in ['0'..'9',#8])then
begin
  Key := #0;
end;
  end;
end;

procedure Tfrm_Produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
	begin
		Key := #0;
		Perform(wm_nextDlgCtl, 0, 0);
	end;
end;

procedure Tfrm_Produtos.btnCancelarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Produtos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Produtos.Button1Click(Sender: TObject);
begin
ShowMessage(dadosfiltro);
end;

procedure Tfrm_Produtos.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if Odd(dbDados.DataSource.Dataset.RecNo)then
begin
dbDados.Canvas.Brush.Color := $00E9E9E9;
end else
dbDados.Canvas.Brush.Color := clWhite;

if (gdSelected in State) then
begin
dbDados.Canvas.Brush.Color := clHighlight;
dbDados.Canvas.Font.Color := clWhite;
dbDados.Canvas.Font.Style := [fsBold];
end;
dbDados.Canvas.FillRect(Rect);
dbDados.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_Produtos.editDescricaoEnter(Sender: TObject);
begin
editDescricao.Color := clSkyBlue;
end;

procedure Tfrm_Produtos.editQuantidadeEnter(Sender: TObject);
begin
 editQuantidade.Color := clSkyBlue;
end;

procedure Tfrm_Produtos.cbFornecedorEnter(Sender: TObject);
begin
cbFornecedor.Color := clSkyBlue;
end;

procedure Tfrm_Produtos.cbTipoEnter(Sender: TObject);
begin
cbTipo.Color := clSkyBlue;
end;

procedure Tfrm_Produtos.editDescricaoExit(Sender: TObject);
begin
editDescricao.Color := clWhite;
end;

procedure Tfrm_Produtos.editQuantidadeExit(Sender: TObject);
begin
editQuantidade.Color := clWhite;
end;

procedure Tfrm_Produtos.cbTipoExit(Sender: TObject);
begin
cbTipo.Color := clWhite;
end;

procedure Tfrm_Produtos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Produto.Active := false;
end;

procedure Tfrm_Produtos.dbDadosDblClick(Sender: TObject);
begin
if frm_BuscarProduto <> nil then
begin
frm_BuscarProduto.editConsulta.Text := tbl_Produto.FieldByName('Descricao_Produto').Value;
Self.Close;
end;
end;

procedure Tfrm_Produtos.BitBtn1Click(Sender: TObject);
begin
frm_ConsultaProdutos := Tfrm_ConsultaProdutos.Create(Self);
frm_ConsultaProdutos.ShowModal;
try
finally
frm_ConsultaProdutos.Free;
frm_ConsultaProdutos := nil;
end;
end;

procedure Tfrm_Produtos.dbDadosCellClick(Column: TColumn);
begin
if tbl_Produto.RecordCount >0 then
begin
cbTipo.Text := tbl_Produto.FieldByName('Tipo_Produto').AsString;
end;
end;

end.

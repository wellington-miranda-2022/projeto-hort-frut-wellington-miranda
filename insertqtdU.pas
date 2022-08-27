unit insertqtdU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, ComCtrls, Spin;

type
  Tfrm_InserirQtd = class(TForm)
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    Bevel2: TBevel;
    Panel2: TPanel;
    tbl_Produtos: TTable;
    BitBtn1: TBitBtn;
    GBFiltro: TGroupBox;
    Label2: TLabel;
    editProduto: TEdit;
    Label1: TLabel;
    editEstoque: TEdit;
    Label3: TLabel;
    Bevel3: TBevel;
    btnInserir: TSpeedButton;
    btnProcurar: TSpeedButton;
    editQTD: TSpinEdit;
    Bevel5: TBevel;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editQTDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_InserirQtd: Tfrm_InserirQtd;

implementation

uses buscarprodutoU, principalU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_InserirQtd.btnProcurarClick(Sender: TObject);
begin
inserirqtd := 2;
frm_BuscarProduto := TFrm_BuscarProduto.Create(self);
frm_BuscarProduto.ShowModal;
try
finally
frm_BuscarProduto.Free;
frm_BuscarProduto := nil;
end;
end;

procedure Tfrm_InserirQtd.btnInserirClick(Sender: TObject);
var
qtd, estoque : Integer;
begin
if editProduto.Text = '' then
begin
MessageDlg('Escolha o produto!',MtError,[mbok],0);
exit;
end;

qtd := StrToInt(editQTD.Text);
tbl_Produtos.edit;

if tbl_Produtos.FieldByName('Qtd_Produto').Value = null then
begin
tbl_Produtos.FieldByName('Qtd_Produto').Value := 0;
end;

estoque := tbl_Produtos.FieldByName('Qtd_Produto').Value + qtd;
editEstoque.Text := IntToStr(estoque);
tbl_Produtos.FieldByName('Qtd_Produto').Value := estoque;
tbl_Produtos.Post;
MessageDlg('Quantidade adicionada com sucesso!',MtInformation,[mbok],0);
produto := '';
editQTD.Text := '0';
editQTD.SelectAll;
end;

procedure Tfrm_InserirQtd.FormCreate(Sender: TObject);
begin
tbl_Produtos.Active := true;
editQTD.Text := '0';
  Panel1.Color := frm_Ajustes.tbl_Ajustes.FieldByName('Ajustes_AJuste').Value;
end;

procedure Tfrm_InserirQtd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Produtos.Active := false;
end;

procedure Tfrm_InserirQtd.editQTDKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then
Key := #0;
end;

procedure Tfrm_InserirQtd.FormShow(Sender: TObject);
begin

 Panel1.Color := cor;
  Panel2.Color := cor - 30;

editProduto.Text := produto;
tbl_Produtos.Filtered := true;
tbl_Produtos.Filter := 'Descricao_Produto = '+Quotedstr(produto);
editEstoque.Text := tbl_Produtos.FieldByName('Qtd_Produto').AsString;
end;

procedure Tfrm_InserirQtd.BitBtn1Click(Sender: TObject);
begin
Self.Close;
inserirqtd := 0;
produto := '';
end;

procedure Tfrm_InserirQtd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

end.

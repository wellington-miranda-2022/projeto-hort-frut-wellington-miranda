unit buscarprodutoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, DBTables;

type
  Tfrm_BuscarProduto = class(TForm)
    Label1: TLabel;
    editConsulta: TEdit;
    Label2: TLabel;
    editProduto: TEdit;
    ds_BuscarProduto: TDataSource;
    tbl_BuscarProduto: TTable;
    DBProdutos: TDBGrid;
    tbl_BuscarProdutoDescricao_Produto: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    tbl_BuscarProdutoQtd_Produto: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBProdutosCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure DBProdutosDblClick(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  frm_BuscarProduto: Tfrm_BuscarProduto;
  produto: String;

implementation

uses pedidoU, novopedU, principalU, insertqtdU, comprasU, avariaU,
  produtosU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_BuscarProduto.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_BuscarProduto.DBProdutosCellClick(Column: TColumn);
begin
editProduto.Text := tbl_BuscarProduto.FieldByName('Descricao_Produto').AsString;

end;

procedure Tfrm_BuscarProduto.FormCreate(Sender: TObject);
begin
tbl_BuscarProduto.Active := true;
editConsulta.Clear;



end;

procedure Tfrm_BuscarProduto.editConsultaChange(Sender: TObject);
begin
if Length(editConsulta.Text)= 0 then
begin
editConsulta.Text := 'DIGITE PRODUTO DESEJADO';
tbl_BuscarProduto.Filtered := false;
editConsulta.SelectAll;
end else
if editConsulta.Text <> '' then
begin
tbl_BuscarProduto.Close;
tbl_BuscarProduto.Filter := 'Descricao_Produto = ' + Quotedstr(editConsulta.Text+'*');
tbl_BuscarProduto.Open;
tbl_BuscarProduto.Filtered := true;
produto :=  tbl_BuscarProduto.FieldByName('Descricao_Produto').AsString;
editProduto.Text := produto;
end;
end;

procedure Tfrm_BuscarProduto.DBProdutosDblClick(Sender: TObject);
begin
if inserirqtd = 1 then
begin
produto := editProduto.Text;
close;
frm_NovoPed.Hide;
frm_NovoPed.Show;
end;

if inserirqtd = 2 then
begin
produto := editProduto.Text;
close;
frm_InserirQtd.Hide;
frm_InserirQtd.Show;
end;

if (inserirqtd = 3)or(inserirqtd = 5) then
begin
produto := editProduto.Text;
close;
frm_Compras.Hide;
frm_Compras.Show;
end;

if inserirqtd = 6 then
begin
produto := editProduto.Text;
close;
frm_NovoPed.Hide;
frm_NovoPed.Show;
end;

if inserirqtd = 7 then
begin
frm_Avaria.editProduto.Text := tbl_BuscarProduto.FieldByName('Descricao_Produto').Value;
close;
end;
end;



procedure Tfrm_BuscarProduto.editConsultaClick(Sender: TObject);
begin
editConsulta.Clear;
end;

procedure Tfrm_BuscarProduto.editConsultaEnter(Sender: TObject);
begin
editConsulta.SelectAll;
end;

procedure Tfrm_BuscarProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_BuscarProduto.FormShow(Sender: TObject);
begin
editConsulta.SetFocus;
Panel1.Color := cor;
   Panel2.Color := cor - 30;
 // Panel3.Color := frm_Ajustes.tbl_Ajustes.FieldByName('Ajustes_AJuste').Value;
end;

procedure Tfrm_BuscarProduto.SpeedButton1Click(Sender: TObject);
begin
frm_Produtos := Tfrm_Produtos.Create(Self);
frm_Produtos.ShowModal;
try
finally
frm_Produtos.Free;
frm_Produtos := nil;
end;
end;

end.

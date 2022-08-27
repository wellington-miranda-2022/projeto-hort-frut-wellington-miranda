unit pedidoU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  DBTables, ComCtrls, Mask;

type
  Tfrm_Pedidos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    DBPedido: TDBGrid;
    Label1: TLabel;
    lblTotalPedido: TLabel;
    Data: TDateTimePicker;
    cbCliente: TComboBox;
    tbl_Cliente: TTable;
    Label2: TLabel;
    Label3: TLabel;
    editProduto: TEdit;
    Valor: TLabel;
    editValor: TEdit;
    Quantidade: TLabel;
    editQuantidade: TEdit;
    ds_Pedidos: TDataSource;
    tbl_Pedidos: TTable;
    tbl_PedidosProduto_Pedido: TStringField;
    tbl_PedidosValor_Pedido: TFloatField;
    tbl_PedidosTotal_Pedido: TFloatField;
    tbl_PedidosQuantidade_Pedido: TIntegerField;
    tbl_PedidosCliente_Pedido: TStringField;
    tbl_PedidosData_Pedido: TDateField;
    tbl_PedidosStatus_Pedido: TStringField;
    tbl_PedidosUsuario_Pedido: TStringField;
    tbl_PedidosFrete_Pedido: TFloatField;
    btnNovo: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    btnFinalizar: TSpeedButton;
    cbSituacao: TComboBox;
    Label4: TLabel;
    lblContarGrid: TLabel;
    Label5: TLabel;
    btnAdcFrete: TSpeedButton;
    editFrete: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure cbSituacaoChange(Sender: TObject);
    procedure DBPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBPedidoCellClick(Column: TColumn);
    procedure btnAdcFreteClick(Sender: TObject);
    
  private
    procedure BuscarTudoPedido;
    procedure CarregarCombobox;
    procedure LimparCampos;
    procedure AssociarCampos;
    procedure SomarCampos;
    procedure ContarGrid;

  public
  usuario : String;
  valorTotal : Real;
  end;

var
  frm_Pedidos: Tfrm_Pedidos;


implementation

uses principalU, loginU, buscarprodutoU, prevfreteU;

{$R *.dfm}

procedure Tfrm_Pedidos.BuscarTudoPedido;
 var
 date : String;
begin

tbl_Pedidos.Filtered := False;
tbl_Pedidos.Close;
date := DateToStr(Data.Date);
tbl_Pedidos.Filter := 'Data_Pedido = '+Quotedstr(date);
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := True;


end;

procedure Tfrm_Pedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;
  Perform(wm_nextDlgCtl, 0, 0);
 end;
end;

procedure Tfrm_Pedidos.CarregarCombobox;
begin
With tbl_Cliente do
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

procedure Tfrm_Pedidos.LimparCampos;
begin
With frm_Pedidos do
  begin
    editQuantidade.Text :='1';
    editValor.Text :='0';
  end;
end;


procedure Tfrm_Pedidos.btnNovoClick(Sender: TObject);
begin
  if (editProduto.Text <> '')and(editQuantidade.Text > '0')and(editValor.Text > '0')and(cbCliente.Text <> '') then
  begin


tbl_Pedidos.Insert;
AssociarCampos;
tbl_Pedidos.Post;

LimparCampos;
SomarCampos;

    end;

   end;


procedure Tfrm_Pedidos.AssociarCampos;
var
quantidade : integer;
valor : Real;
begin
usuario := nome;
quantidade := StrToInt(editQuantidade.Text);
valor := StrToFloat(editValor.Text);
valorTotal := quantidade * valor;

tbl_Pedidos.FieldByName('Produto_Pedido').Value := editProduto.Text;
tbl_Pedidos.FieldByName('Valor_Pedido').Value := valor;
tbl_Pedidos.FieldByName('Quantidade_Pedido').Value := quantidade;
tbl_Pedidos.FieldByName('Total_Pedido').Value := valorTotal;
tbl_Pedidos.FieldByName('Cliente_Pedido').Value := cbCliente.Text;
tbl_Pedidos.FieldByName('Data_Pedido').Value := Data.Date;
tbl_Pedidos.FieldByName('Status_Pedido').Value := 'EM ANDAMENTO';
tbl_Pedidos.FieldByName('Usuario_Pedido').Value := usuario;
tbl_Pedidos.FieldByName('Frete_Pedido').Value := editFrete.Text;


end;

procedure Tfrm_Pedidos.SpeedButton3Click(Sender: TObject);
begin
frm_BuscarProduto := Tfrm_BuscarProduto.Create(self);
frm_BuscarProduto.ShowModal;

try
finally
frm_BuscarProduto.Free;
frm_BuscarProduto := nil;
end;
end;

procedure Tfrm_Pedidos.btnDeletarClick(Sender: TObject);
begin
if messageDlg('Deseja realmente deletar um pedido?',MtConfirmation,[mbyes,mbno],0)=mryes
then
  begin
tbl_Pedidos.Delete;
SomarCampos;
end else
abort;
end;

procedure Tfrm_Pedidos.SpeedButton1Click(Sender: TObject);
begin
DBPedido.options := [DgEditing];
end;

procedure Tfrm_Pedidos.SomarCampos;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_Pedidos do
begin
    tbl_Pedidos.First;
while not tbl_Pedidos.Eof do
begin
somar := (somar + tbl_Pedidos.FieldByName('Total_Pedido').AsFloat);
tbl_Pedidos.Next;
end;
if tbl_Pedidos.FieldByName('Produto_Pedido').Value <> '' then
begin
lblTotalPedido.Caption := FormatFloat('R$ #,,,,.0.0',somar);
ContarGrid;
end;
end;

end;

procedure Tfrm_Pedidos.FormCreate(Sender: TObject);
begin
SomarCampos;
CarregarCombobox;

end;

procedure Tfrm_Pedidos.DataChange(Sender: TObject);
begin
BuscarTudoPedido;
SomarCampos;
RadioGroup1.ItemIndex := 0;
end;

procedure Tfrm_Pedidos.RadioButton1Click(Sender: TObject);
begin
tbl_Pedidos.Filtered := false;
SomarCampos;
end;

procedure Tfrm_Pedidos.RadioButton2Click(Sender: TObject);
begin
BUSCARTUDOPEDIDO;
SomarCampos;
end;

procedure Tfrm_Pedidos.btnFinalizarClick(Sender: TObject);
begin
if tbl_Pedidos.FieldByName('Status_Pedido').Value = 'EM ANDAMENTO' then
begin
if messageDlg('Deseja Finalizar um pedido?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
end;
tbl_Pedidos.Edit;
tbl_Pedidos.FieldByName('Status_Pedido').AsString := 'FINALIZADO';
tbl_Pedidos.Post;
end;

end;

procedure Tfrm_Pedidos.cbSituacaoChange(Sender: TObject);
begin
SomarCampos;
if cbSituacao.ItemIndex = 1 then
begin
tbl_Pedidos.Close;
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Filter := 'Status_Pedido = '+Quotedstr(cbSituacao.Text);
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
end else
tbl_Pedidos.Close;
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Filter := 'Status_Pedido = '+Quotedstr(cbSituacao.Text);
tbl_Pedidos.Open;
tbl_Pedidos.Filtered := true;
ContarGrid;
end;
procedure Tfrm_Pedidos.DBPedidoCellClick(Column: TColumn);
begin
DBPedido.Canvas.Brush.Color := clSkyBlue;
end;

procedure Tfrm_Pedidos.DBPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if tbl_Pedidos.FieldByName('Status_Pedido').Value = 'FINALIZADO' then
begin
DBPedido.Canvas.Brush.Color := clLime;
DBPedido.DefaultDrawDataCell(Rect, DBPedido.Columns[datacol].Field, State);
end else
DBPedido.Canvas.Brush.Color := clWhite;
DBPedido.Canvas.Font.Color := clBlack;
DBPedido.DefaultDrawDataCell(Rect, DBPedido.Columns[datacol].Field, State);


end;



procedure Tfrm_Pedidos.ContarGrid;
begin
lblContarGrid.Caption := IntToStr(tbl_Pedidos.RecordCount);
end;

procedure Tfrm_Pedidos.btnAdcFreteClick(Sender: TObject);
begin
frm_PrevFrete := Tfrm_PrevFrete.Create(Self);
 frm_PrevFrete.ShowModal;
 try
 finally
 frm_PrevFrete.Free;
 frm_PrevFrete := nil;
 end;
end;

end.

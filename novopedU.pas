unit novopedU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  Buttons, DBCtrls, uImportExcel;

type
  Tfrm_NovoPed = class(TForm)
    Label1: TLabel;
    lblTotalPedido: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Valor: TLabel;
    Quantidade: TLabel;
    btnNovo: TSpeedButton;
    btnProduto: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnFinalizar: TSpeedButton;
    Label4: TLabel;
    lblContarGrid: TLabel;
    Label5: TLabel;
    btnFrete: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNPedTotal: TDBNavigator;
    DBPedido: TDBGrid;
    Data: TDateTimePicker;
    cbCliente: TComboBox;
    editProduto: TEdit;
    editValor: TEdit;
    editQuantidade: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    cbSituacao: TComboBox;
    editFrete: TEdit;
    tbl_Cliente: TTable;
    ds_Pedidos: TDataSource;
    tbl_Pedidos: TTable;
    cbFrete: TCheckBox;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    tbl_PedidosCod_PedTotal: TIntegerField;
    tbl_PedidosProduto_Pedido: TStringField;
    tbl_PedidosValor_Pedido: TFloatField;
    tbl_PedidosTotal_Pedido: TFloatField;
    tbl_PedidosCliente_Pedido: TStringField;
    tbl_PedidosData_Pedido: TDateField;
    tbl_PedidosUsuario_Pedido: TStringField;
    ds_PedTotal: TDataSource;
    tbl_PedTotal: TTable;
    tbl_PedTotalCod_PedTotal: TIntegerField;
    tbl_PedTotalCliente_PedTotal: TStringField;
    tbl_PedTotalTotal_PedTotal: TCurrencyField;
    tbl_PedTotalCodVenda_PedTotal: TIntegerField;
    tbl_PedTotalUsuario_PedTotal: TStringField;
    tbl_PedTotalData_PedTotal: TDateField;
    tbl_PedTotalFrete_PedTotal: TCurrencyField;
    tbl_PedTotalStatus_PedTotal: TStringField;
    tbl_PedidosCod_Produto: TIntegerField;
    btnNew: TSpeedButton;
    btnPost: TSpeedButton;
    btnVoltar: TBitBtn;
    DBNPedidos: TDBNavigator;
    btnAdicionar: TBitBtn;
    btnAnexar: TSpeedButton;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    DBPedTotal: TDBGrid;
    tbl_PedidosFornecedor_Pedido: TStringField;
    BarraProgresso: TProgressBar;
    tbl_PedidosQuantidade_Pedido: TFloatField;
    ImportExcel1: TImportExcel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure cbSituacaoChange(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnFreteClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    
    procedure btnFinalizarClick(Sender: TObject);
    procedure cbFreteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure editValorKeyPress(Sender: TObject; var Key: Char);
    procedure btnNewClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBPedTotalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbClienteChange(Sender: TObject);
    procedure DBPedTotalDblClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBPedidoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure editValorClick(Sender: TObject);
    procedure editQuantidadeClick(Sender: TObject);
    procedure editQuantidadeExit(Sender: TObject);
    procedure btnNewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPostMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure editValorExit(Sender: TObject);
    procedure DBPedTotalCellClick(Column: TColumn);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnexarClick(Sender: TObject);
    procedure DBPedidoDblClick(Sender: TObject);

      private

    procedure CarregarCombobox;
    procedure SomarCampos;
    procedure SomarCamposPed;
    procedure ContarGrid;
    procedure BUSCARTUDOPEDIDO;
    procedure AssociarCampos;
    procedure LimparCampos;
    procedure SomarFrete;
    procedure AssociarCamposTotal;
    procedure FiltrarPedidos;
    procedure TratarBotoes;
    procedure FiltrarDetalhe;
    procedure TratarEdits;
    procedure DeletarItens;
    procedure Atualizar;
    procedure HabilitarAnexo;
    procedure Anexar;
    procedure FinalizarPedido;
    procedure FecharTabelas;
    procedure AtivarTabelas;
    procedure Importar;
    procedure Modificar;


  public
   usuario : String;
   valorTotal : Real;
   frete : Real;
   id_produto : Integer;
   cod : integer;
   tudo : Real;
   codigo :Integer;
   fornecedor : String;
  end;

var
  frm_NovoPed: Tfrm_NovoPed;
  totalprevfrete : Real;
  id_venda : Integer;

implementation

uses buscarprodutoU, loginU, principalU, prevfreteU, pedidoU,
  listavenddetalhes, ajustesU;

{$R *.dfm}

procedure Tfrm_NovoPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
 begin
  Key := #0;
  Perform(wm_nextDlgCtl, 0, 0);
 end;
end;

procedure Tfrm_NovoPed.FormCreate(Sender: TObject);
begin
AtivarTabelas;
id_venda := 0;
SomarCampos;
CarregarCombobox;
editValor.SelectAll;
HabilitarAnexo;
end;

procedure Tfrm_NovoPed.CarregarCombobox;
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

procedure Tfrm_NovoPed.SomarCampos;
var
somar : Real;
begin
if DBPedido.Visible = true then
begin
inherited;
somar := 0;
with tbl_Pedidos do
begin
tbl_Pedidos.Active := true;
tbl_Pedidos.First;
while not tbl_Pedidos.Eof do
begin
somar := (somar + tbl_Pedidos.FieldByName('Total_Pedido').AsFloat);
tbl_Pedidos.Next;
end;
end;
if tbl_Pedidos.FieldByName('Produto_Pedido').Value <> '' then
begin
lblTotalPedido.Caption := FormatFloat('R$ #,,,,.0.0',somar + frete);
ContarGrid;
tudo := somar;

end;
end;
end;

procedure Tfrm_NovoPed.btnSairClick(Sender: TObject);
var
cout : Integer;
i: Integer;
codigo : Integer;
codpedtotal : Integer;
begin
tbl_Pedidos.Last;
codigo := tbl_Pedidos.FieldByName('Cod_PedTotal').AsInteger;
tbl_PedTotal.Last;
codpedtotal := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
i := tbl_Pedidos.RecordCount;

if (btnPost.Visible = false)and(btnNovo.Visible = false) then
begin
Close;
tbl_Cliente.Close;
tbl_Cliente.Active := false;
tbl_Pedidos.Close;
tbl_Pedidos.Active := false;
tbl_PedTotal.Close;
tbl_PedTotal.Active := false;
produto := '';
totalprevfrete := 0;
inserirqtd := 0;
exit;
end;

if DBPedido.Visible = false then
begin
i := 0;
end;

if (codigo = codpedtotal)or(i = 0) then
begin
Close;
tbl_Cliente.Close;
tbl_Cliente.Active := false;
tbl_Pedidos.Close;
tbl_Pedidos.Active := false;
tbl_PedTotal.Close;
tbl_PedTotal.Active := false;
produto := '';
totalprevfrete := 0;
inserirqtd := 0;
end else
if MessageDlg('Deseja sair sem finalizar o Pedido?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
FiltrarPedidos;
i := tbl_Pedidos.RecordCount;
for cout := 1 to i do
begin
tbl_Pedidos.Delete;
end;
Close;
tbl_Cliente.Close;
tbl_Cliente.Active := false;
tbl_Pedidos.Close;
tbl_Pedidos.Active := false;
tbl_PedTotal.Close;
tbl_PedTotal.Active := false;
produto := '';
totalprevfrete := 0;
inserirqtd := 0;
end else
abort;
end;

procedure Tfrm_NovoPed.btnProdutoClick(Sender: TObject);
begin
inserirqtd := 1;
frm_BuscarProduto := Tfrm_BuscarProduto.Create(self);
frm_BuscarProduto.ShowModal;

try
finally
frm_BuscarProduto.Free;
frm_BuscarProduto := nil;
end;
end;

procedure Tfrm_NovoPed.FormShow(Sender: TObject);
begin

 Panel1.Color := cor;
  Panel2.Color := cor - 30;
 // Panel3.Color := cor - 30;
  

DBPedTotal.Columns[0].Title.alignment := taCenter;
DBPedTotal.Columns[1].Title.alignment := taCenter;
DBPedTotal.Columns[2].Title.alignment := taCenter;
DBPedTotal.Columns[3].Title.alignment := taCenter;
DBPedTotal.Columns[4].Title.alignment := taCenter;
DBPedTotal.Columns[5].Title.alignment := taCenter;
DBPedTotal.Columns[6].Title.alignment := taCenter;
DBPedTotal.Columns[7].Title.alignment := taCenter;

DBPedido.Columns[0].Title.alignment := taCenter;
DBPedido.Columns[1].Title.alignment := taCenter;
DBPedido.Columns[2].Title.alignment := taCenter;
DBPedido.Columns[3].Title.alignment := taCenter;
DBPedido.Columns[4].Title.alignment := taCenter;
DBPedido.Columns[5].Title.alignment := taCenter;
DBPedido.Columns[6].Title.alignment := taCenter;
DBPedido.Columns[7].Title.alignment := taCenter;

tbl_Pedidos.Active := false;
tbl_PedTotal.Active := false;
tbl_PedTotal.Active := true;
tbl_Pedidos.Active := true;

editProduto.Text := produto;
editFrete.Text := FormatFloat(',,,,.0.0',(totalprevfrete));


Data.Date := Date;

BuscarTudoPedido;
LimparCampos;
SomarCamposPed;

end;

procedure Tfrm_NovoPed.ContarGrid;
begin
if DBPedido.Visible = true then
begin
lblContarGrid.Caption := IntToStr(tbl_Pedidos.RecordCount);
end else
lblContarGrid.Caption := IntToStr(tbl_PedTotal.RecordCount);

end;

procedure Tfrm_NovoPed.RadioButton1Click(Sender: TObject);
begin
if DBPedTotal.Visible = true then
begin
tbl_PedTotal.Filtered := false;
SomarCamposPed;
end else
FiltrarPedidos;
SomarCampos;

end;

procedure Tfrm_NovoPed.RadioButton2Click(Sender: TObject);
begin
if DBPedTotal.Visible = true then
begin
Data.Date := (now);
BUSCARTUDOPEDIDO;
SomarCamposPed;
end else
FiltrarPedidos;
SomarCampos;
end;

procedure Tfrm_NovoPed.BUSCARTUDOPEDIDO;
var
 date : String;
begin

tbl_PedTotal.Filtered := False;
tbl_PedTotal.Close;
date := DateToStr(Data.Date);
tbl_PedTotal.Filter := 'Data_PedTotal = '+Quotedstr(date);
tbl_PedTotal.Open;
tbl_PedTotal.Filtered := True;
end;

procedure Tfrm_NovoPed.cbSituacaoChange(Sender: TObject);
begin
if DBPedTotal.Visible = true then
begin
if cbSituacao.ItemIndex = 0 then
begin
BUSCARTUDOPEDIDO;
SomarCamposPed;
end;
if cbSituacao.ItemIndex = 1 then
begin
tbl_PedTotal.Close;
tbl_PedTotal.Filtered := false;
tbl_PedTotal.Filter := 'Status_PedTotal = '+Quotedstr(cbSituacao.Text);
tbl_PedTotal.Open;
tbl_PedTotal.Filtered := true;
SomarCamposPed;
end else
if cbSituacao.ItemIndex = 2 then
begin
tbl_PedTotal.Close;
tbl_PedTotal.Filtered := false;
tbl_PedTotal.Filter := 'Status_PedTotal = '+Quotedstr(cbSituacao.Text);
tbl_PedTotal.Open;
tbl_PedTotal.Filtered := true;
SomarCamposPed;
ContarGrid;
end;
end;
end;




procedure Tfrm_NovoPed.DataChange(Sender: TObject);
begin
if DBPedTotal.Visible = true then
begin
BuscarTudoPedido;
RadioGroup1.ItemIndex := 0;
cbSituacao.ItemIndex :=0;
SomarCamposPed;
end else
MessageDlg('Voc� n�o pode alterar a data quanto tiver colocando itens ao pedido!',MtWarning,[mbok],0)
end;

procedure Tfrm_NovoPed.btnNovoClick(Sender: TObject);
begin
if cbCliente.Text = 'ESCOLHA O CLIENTE DESEJADO' then
begin
MessageDlg('Escolha um cliente para anexar ao pedido!',MtWarning,[mbok],0);
cbCliente.SelectAll;
exit;
end;
DBPedTotal.Visible := false;
DBPedido.Visible := true;
if (editProduto.Text <> '')and(editQuantidade.Text <> '0')and(editValor.Text <> '0')and(cbCliente.Text <> 'ESCOLHA O CLIENTE DESEJADO') then
  begin
tbl_Pedidos.Insert;
tbl_Pedidos.FieldByName('Cod_PedTotal').AsInteger := id_produto;
AssociarCampos;
tbl_Pedidos.Post;

FiltrarPedidos;
SomarCampos;

editValor.Text := '0';
editQuantidade.Text := '0';

    end;

   end;

procedure Tfrm_NovoPed.AssociarCampos;
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
tbl_Pedidos.FieldByName('Usuario_Pedido').Value := usuario;
tbl_Pedidos.FieldByName('Cod_Pedtotal').Value := id_produto;

end;

procedure Tfrm_NovoPed.btnFreteClick(Sender: TObject);
begin
btnFrete.Enabled := false;
frm_PrevFrete := Tfrm_PrevFrete.Create(Self);
 frm_PrevFrete.ShowModal;
 try
 finally
 frm_PrevFrete.Free;
 frm_PrevFrete := nil;
 end;
end;

procedure Tfrm_NovoPed.LimparCampos;
begin
begin
With frm_NovoPed do
  begin
    editQuantidade.Text :='1';
    editValor.Text :='0';
  end;
end;
end;

procedure Tfrm_NovoPed.btnDeletarClick(Sender: TObject);
begin
  if (tbl_PedTotal.RecordCount = 0)and(DBPedTotal.Visible = true) then
begin
messageDlg('N�o h� registros a serem deletados!',MtError,[mbok],0);
exit;
end;
if messageDlg('Deseja realmente deletar um pedido?',MtConfirmation,[mbyes,mbno],0)=mryes
then
  begin
    if (DBPedido.Visible = true)and(DBPedTotal.Visible = false) then
  begin
  tbl_Pedidos.Delete;
  ContarGrid;
  SomarCampos;
  exit;
  end;
  if DBPedTotal.Visible = true then
  begin
  DeletarItens;
  SomarCamposPed;
  ContarGrid;
end;
end;
end;

procedure Tfrm_NovoPed.btnFinalizarClick(Sender: TObject);
begin
FinalizarPedido;
end;
procedure Tfrm_NovoPed.SomarFrete;
var
somar : Real;
begin
inherited;
somar := 0;
with tbl_PedTotal do
begin
    tbl_PedTotal.First;
while not tbl_PedTotal.Eof do
begin
somar := (somar + tbl_PedTotal.FieldByName('Frete_PedTotal').AsFloat);
tbl_PedTotal.Next;
end;
end;

frete := somar;

end;

procedure Tfrm_NovoPed.cbFreteClick(Sender: TObject);
begin
if cbFrete.Checked = false then
 begin
    frete := 0;
    SomarCamposPed;
end;
if cbFrete.Checked = true then
begin
    SomarFrete;
    SomarCamposPed;

end;
end;

procedure Tfrm_NovoPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_NovoPed.editQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (Key in ['0'..'9',#8])then
begin
  Key := #0;
end;
end;

procedure Tfrm_NovoPed.editValorKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8,','])then
begin
  Key := #0;
end;
end;

procedure Tfrm_NovoPed.AssociarCamposTotal;
begin
usuario := nome;
id_venda := 0;

tbl_PedTotal.FieldByName('Total_PedTotal').Value := lblTotalPedido.Caption;
tbl_PedTotal.FieldByName('Cliente_PedTotal').Value := cbCliente.Text;
tbl_PedTotal.FieldByName('Usuario_PedTotal').Value := usuario;
tbl_PedTotal.FieldByName('Data_PedTotal').Value := Data.Date;
tbl_PedTotal.FieldByName('Frete_PedTotal').Value := editFrete.Text;
tbl_PedTotal.FieldByName('Status_PedTotal').Value := 'EM ANDAMENTO';
tbl_PedTotal.FieldByName('CodVenda_PedTotal').Value := id_venda;

end;

procedure Tfrm_NovoPed.btnNewClick(Sender: TObject);
begin
btnAnexar.Visible := true;
btnProduto.Enabled := true;
btnFrete.Enabled := true;
editValor.Enabled := true;
editQuantidade.Enabled := true;
cbCliente.Enabled := true;
btnNew.Visible := false;
btnPost.Visible := true;
btnNovo.Visible := true;
btnDeletar.Visible := true;
cbFrete.Visible := false;
DBPedTotal.Visible := false;
DBPedido.Visible := true;
btnFinalizar.Visible := false;
ContarGrid;
FiltrarPedidos;
SomarCampos;
tbl_PedTotal.Filtered := false;
tbl_PedTotal.Last;
id_produto := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger + 1;

end;


procedure Tfrm_NovoPed.FiltrarPedidos;
begin
tbl_PedTotal.Last;
tbl_PedTotal.Filtered := false;
tbl_PedTotal.Last;
id_produto := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger + 1;
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Filter := 'Cod_PedTotal = '+Quotedstr(IntToStr(id_produto));
tbl_Pedidos.Filtered := true;
codigo := id_Produto;
end;

procedure Tfrm_NovoPed.btnPostClick(Sender: TObject);
var
prox : Integer;
begin
BarraProgresso.Position := 0;
if lblContarGrid.Caption = '0' then
begin
MessageDlg('Insira itens no pedido!',MtWarning,[mbok],0);
exit;
end;

if cbCliente.Text <> 'ESCOLHA O CLIENTE DESEJADO' then
begin
tbl_PedTotal.Active := false;
tbl_PedTotal.Active := true;
tbl_PedTotal.Filtered := false;
tbl_PedTotal.Last;
prox := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger + 1;

tbl_PedTotal.Append;
tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger := prox;
AssociarCamposTotal;
tbl_PedTotal.Post;

btnAnexar.Visible := false;
TratarBotoes;
LimparCampos;
tbl_PedTotal.Filtered := true;
SomarCamposPed;
TratarEdits;
totalprevfrete := 0;
editProduto.Text := '';
cbCliente.Text := 'ESCOLHA O CLIENTE DESEJADO';

end else
MessageDlg('Escolha um Cliente para o Pedido',MtWarning,[mbok],0);
end;

procedure Tfrm_NovoPed.TratarBotoes;
begin
DBPedido.Visible := not DBPedido.Visible;
DBPedTotal.Visible := not DBPedTotal.Visible;
btnPost.Visible := not btnPost.Visible;
btnNew.Visible := not btnNew.Visible;
cbFrete.Visible := not cbFrete.Visible;
btnNovo.Visible := not btnNovo.Visible;
btnFinalizar.Visible := not btnFinalizar.Visible;
DBNPedTotal.Visible := not DBNPedTotal.Visible;
DBNPedidos.Visible := not DBNPedidos.Visible;
end;



procedure Tfrm_NovoPed.btnExcluirClick(Sender: TObject);
begin
FiltrarPedidos;
end;

procedure Tfrm_NovoPed.SomarCamposPed;
var
somar : Real;
begin
if DBPedTotal.Visible = true then
begin
inherited;
somar := 0;
with tbl_PedTotal do
begin
tbl_PedTotal.Active := true;
tbl_PedTotal.First;
while not tbl_PedTotal.Eof do
begin
somar := (somar + tbl_PedTotal.FieldByName('Total_PedTotal').AsFloat);
tbl_PedTotal.Next;
end;
end;
if tbl_PedTotal.FieldByName('Cliente_PedTotal').Value <> '' then
begin
lblTotalPedido.Caption := FormatFloat('R$ #,,,,.0.0',somar + frete);
ContarGrid;


end;
end;
end;

procedure Tfrm_NovoPed.DBPedTotalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if tbl_PedTotal.FieldByName('Status_PedTotal').Value = 'FINALIZADO' then
begin
DBPedTotal.Canvas.Brush.Color := clLime;
DBPedTotal.DefaultDrawDataCell(Rect, DBPedTotal.Columns[datacol].Field, State);
end else
DBPedTotal.Canvas.Brush.Color := clWhite;
DBPedTotal.Canvas.Font.Color := clBlack;
DBPedTotal.DefaultDrawDataCell(Rect, DBPedTotal.Columns[datacol].Field, State);
if (gdSelected in State) then
begin
DBPedTotal.Canvas.Brush.Color := clHighlight;
DBPedTotal.Canvas.Font.Color := clWhite;
DBPedTotal.Canvas.Font.Style := [fsBold];
end;
DBPedTotal.Canvas.FillRect(Rect);
DBPedTotal.DefaultDrawColumnCell( Rect, DataCol, Column, State);
end;

procedure Tfrm_NovoPed.cbClienteChange(Sender: TObject);
begin
cbCliente.Enabled := false;
end;

procedure Tfrm_NovoPed.FiltrarDetalhe;
var
codigo : Integer;
codped : integer;
cliente : String;
begin
codped := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
codigo := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
cliente := tbl_PedTotal.FieldByName('Cliente_PedTotal').AsString;
DBPedTotal.Visible := false;
DBPedido.Visible := true;
if codped = codigo then
begin
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Filter := 'Cod_PedTotal = '+Quotedstr(IntToStr(codped))+'and Cliente_Pedido = '+Quotedstr(cliente);
tbl_Pedidos.Filtered := true;
end;

end;

procedure Tfrm_NovoPed.DBPedTotalDblClick(Sender: TObject);
begin
cod := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
FiltrarDetalhe;
SomarCampos;
Atualizar;
btnDeletar.Visible := true;
btnVoltar.Visible := true;
cbFrete.Visible := false;
btnFinalizar.Visible := false;
btnNew.Visible := false;
btnPost.Visible := false;
DBNPedidos.Visible := true;
DBNPedTotal.Visible := false;
end;

procedure Tfrm_NovoPed.btnVoltarClick(Sender: TObject);
begin
Atualizar;
tbl_Pedidos.Filtered := false;
DBPedido.Visible := false;
DBPedTotal.Visible := true;
btnVoltar.Visible := false;
cbFrete.Visible := true;
btnNew.Visible := true;
btnFinalizar.Visible := true;
DBNPedidos.Visible := false;
DBNPedTotal.Visible := true;

SomarCamposPed;

end;

procedure Tfrm_NovoPed.TratarEdits;
begin
editProduto.Enabled := not editProduto.Enabled;
editFrete.Enabled := not editFrete.Enabled;
editValor.Enabled := not editValor.Enabled;
editQuantidade.Enabled := not editQuantidade.Enabled;

end;

procedure Tfrm_NovoPed.DeletarItens;
var
codigo : Integer;
codped : integer;
cliente : String;
cout, i : Integer;
begin
codped := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
codigo := tbl_PedTotal.FieldByName('Cod_PedTotal').AsInteger;
cliente := tbl_PedTotal.FieldByName('Cliente_PedTotal').AsString;
DBPedido.Visible := true;
if codped = codigo then
begin
tbl_Pedidos.Filtered := false;
tbl_Pedidos.Filter := 'Cod_PedTotal = '+Quotedstr(IntToStr(codped))+'and Cliente_Pedido = '+Quotedstr(cliente);
tbl_Pedidos.Filtered := true;
ContarGrid;
cout := StrToInt(lblContarGrid.Caption);
for i := 1 to cout do
begin
tbl_Pedidos.Delete;
end;
tbl_PedTotal.Delete;
end;
end;

procedure Tfrm_NovoPed.Atualizar;
var
codigo : Integer;
begin

codigo := tbl_Pedidos.FieldByName('Cod_PedTotal').AsInteger;
if cod = codigo then
begin
tbl_PedTotal.Locate('Cod_PedTotal',IntToStr(cod),[]);
tbl_PedTotal.Edit;
tbl_PedTotal.FieldByName('Total_PedTotal').AsFloat := tudo;
tbl_PedTotal.Post;
end;
end;

procedure Tfrm_NovoPed.DBPedidoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if not odd(tbl_Pedidos.RecNo) then
    if not (gdSelected in State) then
      begin
      DBPedido.Canvas.Brush.Color := $00E9E9E9;
      DBPedido.Canvas.FillRect(Rect);
      DBPedido.DefaultDrawDataCell(rect, Column.Field,state);

    end;
end;

procedure Tfrm_NovoPed.editValorClick(Sender: TObject);
begin
editValor.Clear;
end;

procedure Tfrm_NovoPed.editQuantidadeClick(Sender: TObject);
begin
editQuantidade.Clear;
end;

procedure Tfrm_NovoPed.editQuantidadeExit(Sender: TObject);
begin
if Length(editQuantidade.Text)=0 then
begin
editQuantidade.Text := '1';
end;
end;

procedure Tfrm_NovoPed.btnNewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
btnNew.Flat := true;
end;

procedure Tfrm_NovoPed.btnPostMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
btnPost.Flat := true;
end;

procedure Tfrm_NovoPed.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
btnPost.Flat := false;
btnNew.Flat := false;
end;

procedure Tfrm_NovoPed.editValorExit(Sender: TObject);
begin
if Length(editValor.Text)=0 then
begin
editValor.Text := '0,00';
end;
end;

procedure Tfrm_NovoPed.HabilitarAnexo;
var
id_venda : Integer;
begin
if frm_ListaVendaDetalhes <> nil then
begin
id_venda := frm_ListaVendaDetalhes.tbl_VendTotal.FieldByName('CodVendTotal').AsInteger + 1;
btnAdicionar.Visible := true;
btnFinalizar.Visible := false;
btnNew.Visible := false;
produto :=''
end;
end;

procedure Tfrm_NovoPed.DBPedTotalCellClick(Column: TColumn);
begin
if frm_ListaVendaDetalhes <> nil then
begin
btnAdicionar.Enabled := true;
end;
end;

procedure Tfrm_NovoPed.btnAdicionarClick(Sender: TObject);
begin
FinalizarPedido;
Anexar;
end;

procedure Tfrm_NovoPed.Anexar;
begin
tbl_PedTotal.Edit;
tbl_PedTotal.FieldByName('CodVenda_PedTotal').AsInteger := id_venda;
tbl_PedTotal.Post;
MessageDlg('Pedido Anexado com sussesso!',MtInformation,[mbok],0);
Self.Close;
end;

procedure Tfrm_NovoPed.FinalizarPedido;
begin
if tbl_PedTotal.FieldByName('Status_PedTotal').Value = 'FINALIZADO' then
begin
MessageDlg('Pedido est� finalizado!',MtWarning,[mbok],0);
exit;
end;
if tbl_PedTotal.RecordCount = 0 then
begin
MessageDlg('N�o a nenhum pedido para ser finalizado!',MtWarning,[mbok],0);
exit;
end;

if (tbl_PedTotal.FieldByName('Status_PedTotal').Value = 'EM ANDAMENTO')or (tbl_PedTotal.FieldByName('Status_PedTotal').Value = '') then
begin

if messageDlg('Deseja Finalizar um pedido?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_PedTotal.Edit;
tbl_PedTotal.FieldByName('Status_PedTotal').AsString := 'FINALIZADO';
tbl_PedTotal.Post;
end else
abort;
end;
end;

procedure Tfrm_NovoPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_NovoPed.FecharTabelas;
begin
tbl_Pedidos.Active := false;
tbl_PedTotal.Active := false;
tbl_Cliente.Active := false;
end;

procedure Tfrm_NovoPed.AtivarTabelas;
begin
tbl_Pedidos.Active := true;
tbl_PedTotal.Active := true;
end;

procedure Tfrm_NovoPed.btnAnexarClick(Sender: TObject);
begin
Importar;
end;

procedure Tfrm_NovoPed.Importar;
var
vfile : String;
i: Integer;
begin
if cbCliente.Text = 'ESCOLHA O CLIENTE DESEJADO' then
begin
MessageDlg('Escolha um Cliente antes de fazer a importa��o dos dados!',MtWarning,[mbok],0);
exit;
end;
usuario := nome;
with OpenDialog1 do
begin

InitialDir := ExtractFilePath(Application.ExeName);

if (Execute)and(FileName <> '') then
begin
  vfile := FileName;
  ImportExcel1.ExcelFile := vfile;
  ImportExcel1.ExcelParaStringGrid(StringGrid1,nil);
  BarraProgresso.Max := StringGrid1.Row;
  BarraProgresso.Position := 0;

for i:=1 to Pred(StringGrid1.RowCount) do
begin
  with tbl_Pedidos do
  begin
  Insert;
  FieldByName('Cod_PedTotal').AsString := IntToStr(codigo);
  FieldByName('Produto_Pedido').Value := AnsiUpperCase(StringGrid1.Cells[0,i]);
  FieldByName('Quantidade_Pedido').Value := StringGrid1.Cells[1,i];
  FieldByName('Valor_Pedido').Value := StringGrid1.Cells[2,i];
  FieldByName('Total_Pedido').Value := StringGrid1.Cells[3,i];
  FieldByName('Cliente_Pedido').Value := cbCliente.Text;
  FieldByName('Data_Pedido').Value := Data.Date;
  FieldByName('Usuario_Pedido').Value := usuario;
  FieldByName('Fornecedor_Pedido').Value := AnsiUpperCase(StringGrid1.Cells[4,i]);
  Post;
  BarraProgresso.Position := BarraProgresso.Position + 1;
  end;

end;
  MessageDlg('Dados importados com sucesso!',MtInformation,[mbok],0);
  ContarGrid;
  SomarCampos;
  end;
end;
end;


procedure Tfrm_NovoPed.DBPedidoDblClick(Sender: TObject);
begin
Modificar;
end;

procedure Tfrm_NovoPed.Modificar;
var
dados,fornecedor : String;
begin

if tbl_Pedidos.RecordCount>0 then
begin

fornecedor := tbl_Pedidos.FieldByName('Fornecedor_Pedido').VALUE;
dados := InputBox('Modificando','Novo Valor:',AnsiUpperCase(fornecedor));
tbl_Pedidos.Edit;
tbl_Pedidos.FieldByName('Fornecedor_Pedido').VALUE := AnsiUpperCase(dados);

end;
end;

end.

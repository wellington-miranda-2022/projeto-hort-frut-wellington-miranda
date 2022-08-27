unit ajustesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, ComCtrls, ExtCtrls, StdCtrls,
  Buttons;

type
  Tfrm_Ajustes = class(TForm)
    DataSource1: TDataSource;
    Query1: TQuery;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    ColorDialog1: TColorDialog;
    tbl_Ajustes: TTable;
    tbl_AjustesCod_Ajuste: TAutoIncField;
    tbl_AjustesDescricao_Ajuste: TStringField;
    tbl_AjustesAjustes_AJuste: TFloatField;
    Label2: TLabel;
    cbPlanoConta: TComboBox;
    Label3: TLabel;
    cbContaDebito: TComboBox;
    Label5: TLabel;
    cbContaCredito: TComboBox;
    tbl_ContaCorrente: TTable;
    tbl_ContaCorrenteCod_ContaCorrente: TAutoIncField;
    tbl_ContaCorrenteDescricao_ContaCorrente: TStringField;
    tbl_ContaCorrenteAgencia_ContaCorrente: TStringField;
    tbl_ContaCorrenteBanco_ContaCorrente: TStringField;
    tbl_ContaCorrenteAtivo_ContaCorrente: TStringField;
    tbl_ContaCorrenteId_Conta: TIntegerField;
    tbl_ContaCorrenteConta_ContaCorrente: TStringField;
    tbl_ContaCorrenteSaldo_ContaCorrente: TCurrencyField;
    GroupBox2: TGroupBox;
    dbAjustes: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbAjustesDblClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPlanoContaChange(Sender: TObject);
    procedure cbContaCreditoChange(Sender: TObject);
    procedure cbContaDebitoChange(Sender: TObject);
  private
    procedure Modificar;
    procedure FiltrarConfiguracoes;
    procedure AtivarTabelas;
    procedure SalvarCor;
    procedure CarregarCor;
    procedure FixarValores;
    procedure PlanoComboContas;
    procedure ContaDebito;
    procedure ContaCredito;
    procedure CarregarContaCorrente;
    procedure DeletarCamposVazios;
    function TrocarInformacao(descricao : String ; id_ajuste : Integer):String;
  public
    procedure FiltrarCor;
    { Public declarations }
  end;

var
  frm_Ajustes: Tfrm_Ajustes;

implementation

uses principalU, loginU;

{$R *.dfm}

procedure Tfrm_Ajustes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
  begin
  Self.Close;
  end;
end;

procedure Tfrm_Ajustes.FormCreate(Sender: TObject);
begin
AtivarTabelas;
FiltrarConfiguracoes;
CarregarCor;

 
end;

procedure Tfrm_Ajustes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Query1.Active := false;
tbl_ContaCorrente.Active := false;
//tbl_Ajustes.Active := false;
end;

procedure Tfrm_Ajustes.Modificar;
var
dados : String;
valor : Real;
begin

if Query1.RecordCount>0 then
begin

valor := Query1.FieldByName('Ajustes_Ajuste').VALUE;
dados := InputBox('Modificando','Novo Valor:',FloatToStr(valor));

Query1.Edit;
Query1.FieldByName('Ajustes_Ajuste').VALUE := StrToFloat(dados);
Query1.Post;

Query1.First;
perc_venda := Query1.FieldByName('Ajustes_Ajuste').VALUE;
Query1.Next;
primeiro_planoconta := Query1.FieldByName('Ajustes_Ajuste').VALUE;
Query1.Next;
cc_debito := Query1.FieldByName('Ajustes_Ajuste').Value;
Query1.Next;
prazo_dias := Query1.FieldByName('Ajustes_Ajuste').Value;
Query1.Next;
cc_credito := Query1.FieldByName('Ajustes_Ajuste').Value;

end;

end;

procedure Tfrm_Ajustes.dbAjustesDblClick(Sender: TObject);
begin
Modificar;
end;

procedure Tfrm_Ajustes.FiltrarConfiguracoes;
begin
  with Query1 do
  begin
    Active := false;
    Sql.Clear;
    sql.Add('select * from tbl_Ajustes where cod_ajuste <> 6');
    active := true;
  end;
end;

procedure Tfrm_Ajustes.Panel1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    Panel1.Color := ColorDialog1.Color;
    FiltrarCor;
    SalvarCor;
    frmPrincipal.CarregarCor;
    cor := ColorDialog1.Color;
  end;
end;

procedure Tfrm_Ajustes.AtivarTabelas;
begin
tbl_Ajustes.Active := true;
Query1.Active := true;
tbl_ContaCorrente.Active := true;
end;

procedure Tfrm_Ajustes.FiltrarCor;
begin
  with tbl_Ajustes do
  begin
    Filtered := false;
    Filter := 'Cod_Ajuste = 6';
    Filtered := true;
  end;
end;

procedure Tfrm_Ajustes.BitBtn1Click(Sender: TObject);
begin
FiltrarCor;
Panel1.Color := tbl_Ajustes.FieldByName('Ajustes_Ajuste').Value;
end;

procedure Tfrm_Ajustes.SalvarCor;
begin
 if tbl_Ajustes.RecordCount = 1 then
    begin
    tbl_Ajustes.edit;
    cor := Panel1.Color;
    tbl_Ajustes.FieldByName('Ajustes_Ajuste').Value := cor;
    tbl_Ajustes.Post;
 end;
end;

procedure Tfrm_Ajustes.CarregarCor;
var
cor_padrao : String;
begin
FiltrarCor;
cor := tbl_Ajustes.FieldByName('Ajustes_Ajuste').Value;
cor_padrao := tbl_Ajustes.FieldByName('Ajustes_Ajuste').Value;
Panel1.Color := tbl_Ajustes.FieldByName('Ajustes_Ajuste').Value;
end;

procedure Tfrm_Ajustes.FormShow(Sender: TObject);
begin
CarregarContaCorrente;
FixarValores;
DeletarCamposVazios;
Query1.Refresh;




end;

procedure Tfrm_Ajustes.FixarValores;
begin
PlanoComboContas;
ContaDebito;
ContaCredito;
end;

procedure Tfrm_Ajustes.PlanoComboContas;
var
codigo : String;
begin
  with tbl_ContaCorrente do
  begin
    Query1.First;
    Query1.Next;
    codigo := Query1.FieldByName('Ajustes_Ajuste').AsString;
    Filtered := false;
    Filter := 'Cod_ContaCorrente = '+Quotedstr(codigo);
    Filtered := true;

  if tbl_ContaCorrente.RecordCount>0 then
  begin
    cbPlanoConta.Text := tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString;
  end;


  end;
end;

procedure Tfrm_Ajustes.ContaDebito;
var
codigo : String;
begin
  with tbl_ContaCorrente do
  begin
    Query1.First;
    Query1.Next;
    Query1.Next;
    codigo := Query1.FieldByName('Ajustes_Ajuste').AsString;
    Filtered := false;
    Filter := 'Cod_ContaCorrente = '+Quotedstr(codigo);
    Filtered := true;

  if tbl_ContaCorrente.RecordCount>0 then
  begin
    cbContaDebito.Text := tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString;
  end;


  end;
end;

procedure Tfrm_Ajustes.ContaCredito;
var
codigo : String;
begin
  with tbl_ContaCorrente do
  begin
    Query1.First;
    Query1.Next;
    Query1.Next;
    Query1.Next;
    Query1.Next;
    codigo := Query1.FieldByName('Ajustes_Ajuste').AsString;
    Filtered := false;
    Filter := 'Cod_ContaCorrente = '+Quotedstr(codigo);
    Filtered := true;

  if tbl_ContaCorrente.RecordCount>0 then
  begin
    cbContaCredito.Text := tbl_ContaCorrente.FieldByName('Descricao_ContaCorrente').AsString;
  end;


  end;
end;

procedure Tfrm_Ajustes.CarregarContaCorrente;
begin
  with tbl_ContaCorrente do
  begin
    First;
    cbPlanoConta.Clear;
    cbContaCredito.Clear;
    cbContaCredito.Clear;
    if not isEmpty then
      while not Eof do
      begin
        cbPlanoConta.Items.Add(FieldByName('Descricao_ContaCorrente').AsString);
        cbContaCredito.Items.Add(FieldByName('Descricao_ContaCorrente').AsString);
        cbContaDebito.Items.Add(FieldByName('Descricao_ContaCorrente').AsString);
        Next;
      end;
  end;
end;

function Tfrm_Ajustes.TrocarInformacao(descricao: String ; id_ajuste : Integer):String;
var
cod_ajuste : Integer;
begin
  with tbl_ContaCorrente do
  begin
    Filtered := false;
    Filter := 'Descricao_ContaCorrente = '+Quotedstr(descricao);
    Filtered := true;
  end;

  if tbl_ContaCorrente.RecordCount > 0 then
   begin
     cod_ajuste := tbl_ContaCorrente.FieldByName('Cod_ContaCorrente').AsInteger;
     with tbl_Ajustes do
     begin
        Filtered := false;
        Filter := 'Cod_Ajuste = '+Quotedstr(inttostr(id_ajuste));
        Filtered := true;
        edit;
        FieldByName('Ajustes_Ajuste').Value := cod_ajuste;
        post;
      end;
    end;
Query1.Refresh;
Query1.First;
perc_venda := Query1.FieldByName('Ajustes_Ajuste').VALUE;
Query1.Next;
primeiro_planoconta := Query1.FieldByName('Ajustes_Ajuste').VALUE;
Query1.Next;
cc_debito := Query1.FieldByName('Ajustes_Ajuste').Value;
Query1.Next;
prazo_dias := Query1.FieldByName('Ajustes_Ajuste').Value;
Query1.Next;
cc_credito := Query1.FieldByName('Ajustes_Ajuste').Value;

    if cod_ajuste <> id_ajuste then
    begin
      MessageDlg('Dados atualizados com sucesso!',MtInformation,[mbok],0);
    end;
end;

procedure Tfrm_Ajustes.cbPlanoContaChange(Sender: TObject);
begin
TrocarInformacao(cbPlanoConta.Text,2);
end;

procedure Tfrm_Ajustes.DeletarCamposVazios;
var
descricao : String;
begin
   with tbl_Ajustes do
  begin
    Filtered := false;
    Filter := 'Descricao_Ajuste = '+Quotedstr(descricao);
    Filtered := true;

    if RecordCount >0 then
    begin
      while not Eof do
      begin
        delete;
      end;
    end;
  end;

end;

procedure Tfrm_Ajustes.cbContaCreditoChange(Sender: TObject);
begin
TrocarInformacao(cbContaCredito.Text,5);
end;

procedure Tfrm_Ajustes.cbContaDebitoChange(Sender: TObject);
begin
TrocarInformacao(cbContaDebito.Text,3);
end;

end.

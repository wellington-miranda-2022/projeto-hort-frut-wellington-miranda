unit lancamentopagU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  Buttons;

type
  Tfrm_LancamentosPag = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    tbl_Lancamentos: TTable;
    ds_Lancamentos: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblDescricao: TLabel;
    lblFornecedor: TLabel;
    btnSair: TBitBtn;
    Panel2: TPanel;
    cbMes: TComboBox;
    GroupBox2: TGroupBox;
    DBLancamentos: TDBGrid;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    tbl_LancamentosCod_ContasLancamento: TIntegerField;
    tbl_LancamentosNum_ParcContasLancamento: TIntegerField;
    tbl_LancamentosJuros_ContasLancamento: TFloatField;
    tbl_LancamentosDesconto_ContasLancamento: TFloatField;
    tbl_LancamentosValor_PagContasLancamento: TCurrencyField;
    tbl_LancamentosData_PagContasLancamento: TDateField;
    tbl_LancamentosId_ParcContasLancamento: TIntegerField;
    tbl_LancamentosObs_ContasLancamento: TStringField;
    tbl_ContasPagar: TTable;
    tbl_ContasPagarCod_ContasPagar: TIntegerField;
    tbl_ContasPagarDocumentos_ContasPagar: TStringField;
    tbl_ContasPagarDescricao_ContasPagar: TStringField;
    tbl_ContasPagarValor_ContasPagar: TCurrencyField;
    tbl_ContasPagarData_ContasPagar: TDateField;
    tbl_ContasPagarData_VencContasPagar: TDateField;
    tbl_ContasPagarQtd_ParcelasContasPagar: TIntegerField;
    tbl_ContasPagarFornecedor_ContasPagar: TStringField;
    tbl_ContasDetalhes: TTable;
    tbl_ContasDetalhesCod_ContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_ParcContasDetalhes: TIntegerField;
    tbl_ContasDetalhesNum_DocContasDetalhes: TStringField;
    tbl_ContasDetalhesValor_ParcContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesValor_RestContasDetalhes: TCurrencyField;
    tbl_ContasDetalhesData_VencContasDetalhes: TDateField;
    tbl_ContasDetalhesData_PagContasDetalhes: TDateField;
    tbl_ContasDetalhesStatus_ContasDetalhes: TStringField;
    tbl_ContasDetalhesId_ContasPagar: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure DBLancamentosCellClick(Column: TColumn);
    procedure cbMesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PucharDados;
    procedure AbrirTabelas;
    procedure FecharTabelas;
    procedure FiltrarDados;
    procedure FiltrarMes;
    public
    { Public declarations }
  end;

var
  frm_LancamentosPag: Tfrm_LancamentosPag;

implementation

uses contaseditar, contasapagarU, principalU, listacompdetalhesU,
  listavenddetalhes, comprasU, vendasU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_LancamentosPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FecharTabelas;
end;

procedure Tfrm_LancamentosPag.FormCreate(Sender: TObject);
begin
AbrirTabelas;
PucharDados;
FiltrarDados;

end;

procedure Tfrm_LancamentosPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_LancamentosPag.PucharDados;
begin
tbl_ContasPagar.Active := true;
tbl_ContasPagar.Locate('Cod_ContasPagar', IntToStr(cod),[]);
lblDescricao.Caption := tbl_ContasPagar.FieldByName('Descricao_ContasPagar').AsString;
lblFornecedor.Caption := tbl_ContasPagar.FieldByName('Fornecedor_ContasPagar').AsString;
tbl_ContasPagar.Active := false;
end;

procedure Tfrm_LancamentosPag.btnSairClick(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_LancamentosPag.DBLancamentosCellClick(Column: TColumn);
begin
if tbl_Lancamentos.FieldByName('Obs_ContasLancamento').Value <> '' then
begin
Memo1.Text := tbl_Lancamentos.FieldByName('Obs_ContasLancamento').AsString;
end;
end;

procedure Tfrm_LancamentosPag.AbrirTabelas;
begin
tbl_Lancamentos.Active := true;
tbl_ContasDetalhes.Active := true;
end;

procedure Tfrm_LancamentosPag.FecharTabelas;
begin
tbl_Lancamentos.Active := false;
end;

procedure Tfrm_LancamentosPag.FiltrarDados;
begin

tbl_Lancamentos.Filtered := false;
tbl_Lancamentos.Filter := 'Cod_ContasLancamento = '+Quotedstr(IntToStr(codfiltro));
tbl_Lancamentos.Filtered := true;

end;

procedure Tfrm_LancamentosPag.cbMesChange(Sender: TObject);
begin
FiltrarMes;
end;

procedure Tfrm_LancamentosPag.FiltrarMes;
var
i, cont : Integer;
dia,mes,ano, janeiro : string;
data : Tdate;
begin

dia := formatdatetime('dd',strtodatetime(tbl_Lancamentos.FieldByName('Data_PagContasLancamento').Value));
//mes := formatdatetime('mm',strtodatetime(tbl_Lancamentos.FieldByName('Data_PagContasLancamento').Value));
ano := formatdatetime('yy',strtodatetime(tbl_Lancamentos.FieldByName('Data_PagContasLancamento').Value));
cont := cbMes.ItemIndex;
janeiro := (dia+'/01/'+ano);

for i:= 1 to cont do
begin
data := StrToDate(dia+'/'+'01'+'/'+ano);
data := IncMonth(data,cont);
end;

tbl_Lancamentos.Filtered := false;

if cbMes.ItemIndex = 0 then
begin
tbl_Lancamentos.Filter := ' Data_PagContasLancamento = '+Quotedstr(janeiro)+'and Cod_ContasLancamento = '+Quotedstr(IntToStr(codfiltro));
end;
if cbMes.ItemIndex > 0 then
begin
tbl_Lancamentos.Filter := ' Data_PagContasLancamento = '+Quotedstr(DateToStr(data))+'and Cod_ContasLancamento = '+Quotedstr(IntToStr(cod));
end;

tbl_Lancamentos.Filtered := true;

if tbl_Lancamentos.FieldByName('Cod_ContasLancamento').AsString = '' then
begin
MessageDlg('Não há parcelas existentes nesse periodo!',MtInformation,[mbok],0);
FiltrarDados;
end;

end;

procedure Tfrm_LancamentosPag.FormShow(Sender: TObject);
begin
   Panel1.Color := cor;
  Panel2.Color := cor - 30;
  GroupBox1.Color := cor - 30;
    GroupBox2.Color := cor;
  GroupBox3.Color := cor;

end;

end.

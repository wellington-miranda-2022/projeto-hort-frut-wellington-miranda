unit frm_RelatorioPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, Grids, DBGrids, StdCtrls, ComCtrls,
  Buttons, ExtCtrls, frxClass, frxDBSet;

type
  TfrmRelatorio_Pesquisa = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    dbPesquisa: TDBGrid;
    Panel2: TPanel;
    ds_Cliente: TDataSource;
    qrRelatorio: TQuery;
    Label2: TLabel;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    btnPesquisar: TSpeedButton;
    editConsulta: TEdit;
    btnImprimir: TBitBtn;
    Relatorio: TfrxReport;
    frxRelatorio: TfrxDBDataset;
    lblDataInicial: TLabel;
    editData: TDateTimePicker;
    lblDataFinal: TLabel;
    editDataFinal: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure editConsultaClick(Sender: TObject);
    procedure editConsultaChange(Sender: TObject);
    procedure editDataChange(Sender: TObject);
  private
    function MostrarUsuarios(status:String):String;
    procedure Consultar;
    function FiltrarData(Relatorio : String):String;
    function Pesquisar(select : String):String;
  public
    status : String;
    { Public declarations }
  end;

var
  frmRelatorio_Pesquisa: TfrmRelatorio_Pesquisa;

implementation

uses principalU;

{$R *.dfm}

procedure TfrmRelatorio_Pesquisa.FormShow(Sender: TObject);
begin
  MostrarUsuarios(frmPrincipal.form_entrada);
end;

function TfrmRelatorio_Pesquisa.MostrarUsuarios(status: String): String;
begin

  if frmPrincipal.relatorio = 'Usuarios' then

  Pesquisar('select cod_usuario as ID, Nome_Completo_Usuario as Nome, Nome_usuario as Login, Tipo_Usuario as Tipo, Bloqueio_Usuario as Bloqueado  from tbl_usuario');

  editData.Visible := false;
  editDataFinal.Visible := false;
  lblDataInicial.Visible := false;
  lblDataFinal.Visible := false;

  if status = 'Ativo' then
  begin
    status := 'N'
  end else
  if status = 'Inativo' then
  begin
    status := 'S';
  end;

  with qrRelatorio do
  begin
    Filtered := false;
    Filter := 'Bloqueado = '+QuotedStr(status)+' and Nome = '+QuotedStr(editConsulta.text+'*');

    if (editConsulta.Text = 'PESQUISA POR NOME') or (editConsulta.text = '') then
    begin
       Filter := 'Bloqueado = '+QuotedStr(status);
    end;
    Filtered := true;
  end;   
end;

procedure TfrmRelatorio_Pesquisa.FormCreate(Sender: TObject);
begin
 qrRelatorio.Active := true;
end;

procedure TfrmRelatorio_Pesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrRelatorio.Active := false;
end;

procedure TfrmRelatorio_Pesquisa.btnSairClick(Sender: TObject);
begin
Self.Close;
end;

procedure TfrmRelatorio_Pesquisa.btnImprimirClick(Sender: TObject);
begin
  Relatorio.ShowReport();
end;

procedure TfrmRelatorio_Pesquisa.editConsultaClick(Sender: TObject);
begin
  editConsulta.Clear;
end;

procedure TfrmRelatorio_Pesquisa.Consultar;
begin
  with qrRelatorio do
  begin
    Filtered := false;
    Filter := 'Nome = '+Quotedstr(editConsulta.text+'*')+' and Bloqueado = '+Quotedstr(status);
    Filtered := true;
  end
end;

procedure TfrmRelatorio_Pesquisa.editConsultaChange(Sender: TObject);
begin
{ if Length(editConsulta.Text)>0 then
 begin
 Consultar;
 end else
 qrRelatorio.Filtered := false;  }
 MostrarUsuarios(frmPrincipal.form_entrada);
end;

procedure TfrmRelatorio_Pesquisa.editDataChange(Sender: TObject);
begin
  FiltrarData('Produtos');
end;

function TfrmRelatorio_Pesquisa.FiltrarData(Relatorio: String): String;
begin
  if Relatorio = 'Usuarios' then
  begin
    With qrrelatorio do
    begin
      
    end;
  end;
end;

function TfrmRelatorio_Pesquisa.Pesquisar(select: String): String;
begin
  with qrRelatorio do
  begin
    Close;
    sql.Clear;
    sql.Text := select;
    open;
  end;
end;

end.

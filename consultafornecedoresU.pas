unit consultafornecedoresU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaFornecedores = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_Fornecedores: TIntegerField;
    tbl_ModeloNome_Fornecedores: TStringField;
    tbl_ModeloCNPJ_Fornecedores: TStringField;
    tbl_ModeloTelefone_Fornecedores: TStringField;
    tbl_ModeloBairro_Fornecedores: TStringField;
    tbl_ModeloEndereco_Fornecedores: TStringField;
    tbl_ModeloMunicipio_Fornecedores: TStringField;
    tbl_ModeloCep_Fornecedores: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure LocalizandoFornecedor;
  public
    { Public declarations }
  end;

var
  frm_ConsultaFornecedores: Tfrm_ConsultaFornecedores;

implementation

uses fornecedoresU;

{$R *.dfm}

procedure Tfrm_ConsultaFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

procedure Tfrm_ConsultaFornecedores.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
LocalizandoFornecedor;
end;

procedure Tfrm_ConsultaFornecedores.LocalizandoFornecedor;
var
id_fornecedor : Integer;
begin
if tbl_Modelo.RecordCount >0 then
begin
id_fornecedor := tbl_Modelo.FieldByName('Cod_Fornecedores').Value;
end;
if frm_Fornecedores <> nil then
begin
frm_Fornecedores.tbl_Fornecedores.Active := true;
frm_Fornecedores.tbl_Fornecedores.Locate('Cod_Fornecedores',IntToStr(id_fornecedor),[]);
Self.Close;
end;
end;

end.

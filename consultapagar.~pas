unit consultapagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaPagar = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_ContasPagar: TIntegerField;
    tbl_ModeloDocumentos_ContasPagar: TStringField;
    tbl_ModeloFornecedor_ContasPagar: TStringField;
    tbl_ModeloDescricao_ContasPagar: TStringField;
    tbl_ModeloValor_ContasPagar: TCurrencyField;
    tbl_ModeloData_ContasPagar: TDateField;
    tbl_ModeloData_VencContasPagar: TDateField;
    tbl_ModeloQtd_ParcelasContasPagar: TIntegerField;
    tbl_ModeloPago_ContasPagar: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaPagar: Tfrm_ConsultaPagar;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaPagar.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

end.

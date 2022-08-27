unit consultareceberU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaReceber = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_ContasReceber: TIntegerField;
    tbl_ModeloCliente_ContasReceber: TStringField;
    tbl_ModeloNum_DocContasReceber: TStringField;
    tbl_ModeloQtd_ParcContasReceber: TIntegerField;
    tbl_ModeloValor_ContasReceber: TCurrencyField;
    tbl_ModeloData_ContasReceber: TDateField;
    tbl_ModeloData_VencContasReceber: TDateField;
    tbl_ModeloTipo_ReceitaContasReceber: TStringField;
    tbl_ModeloQuitado_ContasReceber: TDateField;
    tbl_ModeloFalta_ContasReceber: TCurrencyField;
    tbl_ModeloRecebido_ContasReceber: TCurrencyField;
    tbl_ModeloObs_ContasReceber: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaReceber: Tfrm_ConsultaReceber;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaReceber.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

end.

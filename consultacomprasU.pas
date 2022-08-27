unit consultacomprasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaCompras = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_CompTotal: TIntegerField;
    tbl_ModeloFornecedor_CompTotal: TStringField;
    tbl_ModeloLote_CompTotal: TStringField;
    tbl_ModeloData_CompTotal: TDateField;
    tbl_ModeloTotal_CompTotal: TCurrencyField;
    tbl_ModeloFormPag_CompTotal: TStringField;
    tbl_ModeloUsuario_CompTotal: TStringField;
    tbl_ModeloDataVenc_CompTotal: TDateField;
    tbl_ModeloPrazo_CompTotal: TIntegerField;
    tbl_ModeloFrete_CompTotal: TCurrencyField;
    tbl_ModeloSituacao_CompTotal: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaCompras: Tfrm_ConsultaCompras;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaCompras.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

end.

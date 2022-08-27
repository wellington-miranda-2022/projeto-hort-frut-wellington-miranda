unit consultavendasU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaVendas = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCodVendTotal: TIntegerField;
    tbl_ModeloCliente_VendTotal: TStringField;
    tbl_ModeloUsuario_VendTotal: TStringField;
    tbl_ModeloTotal_VendTotal: TCurrencyField;
    tbl_ModeloData_VendTotal: TDateField;
    tbl_ModeloDataVenc_VendTotal: TDateField;
    tbl_ModeloPrazo_VendTotal: TIntegerField;
    tbl_ModeloFormPag_VendTotal: TStringField;
    tbl_ModeloSituacao_VendTotal: TStringField;
    tbl_ModeloFrete_VendTotal: TCurrencyField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaVendas: Tfrm_ConsultaVendas;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaVendas.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

end.

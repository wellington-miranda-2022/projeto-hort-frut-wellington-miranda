unit consultaclientesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBTables, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  Tfrm_ConsultaClientes = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_Cliente: TIntegerField;
    tbl_ModeloNome_Cliente: TStringField;
    tbl_ModeloEndereco_Cliente: TStringField;
    tbl_ModeloBairro_Cliente: TStringField;
    tbl_ModeloCidade_Cliente: TStringField;
    tbl_ModeloUF_Cliente: TStringField;
    tbl_ModeloTelefone_Cliente: TStringField;
    tbl_ModeloCelular_Cliente: TStringField;
    tbl_ModeloEmpresa_Cliente: TStringField;
    tbl_ModeloRG_Cliente: TStringField;
    tbl_ModeloCPF_Cliente: TStringField;
    tbl_ModeloData_Cad: TDateField;
    tbl_ModeloPrivilegio_Cliente: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaClientes: Tfrm_ConsultaClientes;

implementation

{$R *.dfm}

procedure Tfrm_ConsultaClientes.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

end.

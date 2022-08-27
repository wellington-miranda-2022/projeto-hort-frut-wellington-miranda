unit consultabancosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBTables, DBCtrls, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  Tfrm_ConsultaBancos = class(TfrmModelo)
    tbl_Modelo1: TTable;
    tbl_Modelo1Id_Banco: TStringField;
    tbl_Modelo1Banco_Banco: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaBancos: Tfrm_ConsultaBancos;

implementation

uses newcontaU, newcontacorrentesU;

{$R *.dfm}

procedure Tfrm_ConsultaBancos.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo1;
tablepadrao.Active := true;
end;

procedure Tfrm_ConsultaBancos.DBGrid1DblClick(Sender: TObject);
var
codigo, banco : String;
begin
  inherited;
if frm_NewBanco <> nil then
begin

codigo := tbl_Modelo1.FieldByName('Id_Banco').AsString;
banco := tbl_Modelo1.FieldByName('Banco_Banco').AsString;

frm_NewBanco.editCodigo.Text := codigo;
frm_NewBanco.editNome.Text := banco;
Self.Close;

end else
if frm_NewContaCorrentes <> nil then
begin

banco := tbl_Modelo1.FieldByName('Banco_Banco').AsString;

frm_NewContaCorrentes.editDescricao.Text := banco;
Self.Close;

end;
end;

end.

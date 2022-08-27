unit consultaprodutosU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, modeloconsulta, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, DBTables;

type
  Tfrm_ConsultaProdutos = class(TfrmModelo)
    tbl_Modelo: TTable;
    tbl_ModeloCod_Produto: TIntegerField;
    tbl_ModeloDescricao_Produto: TStringField;
    tbl_ModeloTipo_Produto: TStringField;
    tbl_ModeloFornecedores_Produto: TStringField;
    tbl_ModeloQtd_Produto: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ConsultaProdutos: Tfrm_ConsultaProdutos;

implementation

uses produtosU;

{$R *.dfm}

procedure Tfrm_ConsultaProdutos.FormCreate(Sender: TObject);
begin
  inherited;
tablepadrao := tbl_Modelo;
tablepadrao.Active := true;
end;

procedure Tfrm_ConsultaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
tablepadrao.Active := false;
end;

procedure Tfrm_ConsultaProdutos.DBGrid1DblClick(Sender: TObject);
var
inicio : String;
begin
  inherited;
  inicio := tbl_Modelo.FieldByName('Cod_Produto').AsString;
if frm_Produtos <> nil then
begin
frm_Produtos.tbl_Produto.Active := true;
frm_Produtos.tbl_Produto.Locate('Cod_Produto',inicio,[]);
frm_Produtos.tbl_Produto.Active := true;
frm_Produtos.dbDados.Enabled := true;
frm_Produtos.tbl_Produto.Edit;
Self.Close;

end;
end;

end.

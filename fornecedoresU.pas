unit fornecedoresU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons, ExtCtrls;

type
  Tfrm_Fornecedores = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ds_Fornecedores: TDataSource;
    tbl_Fornecedores: TTable;
    tbl_FornecedoresCod_Fornecedores: TIntegerField;
    tbl_FornecedoresNome_Fornecedores: TStringField;
    tbl_FornecedoresCNPJ_Fornecedores: TStringField;
    tbl_FornecedoresTelefone_Fornecedores: TStringField;
    tbl_FornecedoresBairro_Fornecedores: TStringField;
    tbl_FornecedoresEndereco_Fornecedores: TStringField;
    tbl_FornecedoresMunicipio_Fornecedores: TStringField;
    tbl_FornecedoresCep_Fornecedores: TStringField;
    editCod: TDBEdit;
    editNome: TDBEdit;
    editBairro: TDBEdit;
    editMunicipio: TDBEdit;
    editEndereco: TDBEdit;
    editCNPJ: TDBEdit;
    editTelefone: TDBEdit;
    editCEP: TDBEdit;
    BitBtn1: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure tratabotoes();
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editNomeEnter(Sender: TObject);
    procedure editBairroEnter(Sender: TObject);
    procedure editMunicipioEnter(Sender: TObject);
    procedure editEnderecoEnter(Sender: TObject);
    procedure editCNPJEnter(Sender: TObject);
    procedure editCEPEnter(Sender: TObject);
    procedure editTelefoneEnter(Sender: TObject);
    procedure editNomeExit(Sender: TObject);
    procedure editBairroExit(Sender: TObject);
    procedure editMunicipioExit(Sender: TObject);
    procedure editEnderecoExit(Sender: TObject);
    procedure editCNPJExit(Sender: TObject);
    procedure editCEPExit(Sender: TObject);
    procedure editTelefoneExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Fornecedores: Tfrm_Fornecedores;

implementation

uses consultafornecedoresU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Fornecedores.btnSairClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Fornecedores.btnNovoClick(Sender: TObject);
var
prox : Integer;
begin
if MessageDlg('Deseja criar um novo registro?',MtConfirmation,[mbyes,mbno],0)=mryes then
begin
tbl_Fornecedores.Active := true;
tbl_Fornecedores.Last;
prox := tbl_Fornecedores.FieldByName('Cod_Fornecedores').AsInteger + 1;
tbl_Fornecedores.Append;
tbl_Fornecedores.FieldByName('Cod_Fornecedores').AsInteger := prox;
editNome.SetFocus();
tratabotoes();
end else
abort;

end;

procedure Tfrm_Fornecedores.tratabotoes;
begin
btnNovo.Enabled := not btnNovo.Enabled;
btnEditar.Enabled := not btnEditar.Enabled;
btnDeletar.Enabled := not btnEditar.Enabled;
btnGravar.Enabled := not btnEditar.Enabled;
btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure Tfrm_Fornecedores.btnCancelarClick(Sender: TObject);
begin
tbl_Fornecedores.Active :=false;
tratabotoes();
end;

procedure Tfrm_Fornecedores.btnDeletarClick(Sender: TObject);
begin
if tbl_Fornecedores.RecordCount > 0 then
begin
if messageDlg('Deseja deletar esse registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
  then
    begin
      tbl_Fornecedores.Delete;
      tbl_Fornecedores.Active := false;
      tratabotoes();
    end else
   MessageDlg('N�o tem nenhum registro para ser deletado, clique no Bot�o "Novo"!',MtInformation,[mbyes],0);
  end;
end;

procedure Tfrm_Fornecedores.btnEditarClick(Sender: TObject);
begin
if messageDlg('Deseja fazer edi��o no registro?',MtConfirmation,[mbyes,mbno],0)=mrYes
  then
  tbl_Fornecedores.Active := true;
if tbl_Fornecedores.FieldByName('Cod_Fornecedores').AsInteger = 0
  then
    begin
    MessageDlg('Banco de dados v�zios. Crie um novo registro clicando no bot�o "NOVO"',MtInformation,[mbyes],0);
    tbl_Fornecedores.Active := false;
    abort;
end else
      tbl_Fornecedores.Active := true;
      tbl_Fornecedores.Edit;
      tratabotoes();
      EditNome.SetFocus;

end;

procedure Tfrm_Fornecedores.btnGravarClick(Sender: TObject);
begin
messageDlg('Regitro Salvo com sucesso!',MtInformation,[mbyes],0);
      tbl_Fornecedores.Post;
      tratabotoes();
  end;

procedure Tfrm_Fornecedores.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
	begin
		Key := #0;
		Perform(wm_nextDlgCtl, 0, 0);
	end;
end;

procedure Tfrm_Fornecedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

procedure Tfrm_Fornecedores.editNomeEnter(Sender: TObject);
begin
editNome.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editBairroEnter(Sender: TObject);
begin
editBairro.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editMunicipioEnter(Sender: TObject);
begin
editMunicipio.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editEnderecoEnter(Sender: TObject);
begin
editEndereco.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editCNPJEnter(Sender: TObject);
begin
editCNPJ.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editCEPEnter(Sender: TObject);
begin
editCEP.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editTelefoneEnter(Sender: TObject);
begin
editTelefone.Color := clSkyBlue;
end;

procedure Tfrm_Fornecedores.editNomeExit(Sender: TObject);
begin
editNome.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editBairroExit(Sender: TObject);
begin
editBairro.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editMunicipioExit(Sender: TObject);
begin
editMunicipio.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editEnderecoExit(Sender: TObject);
begin
editEndereco.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editCNPJExit(Sender: TObject);
begin
editCNPJ.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editCEPExit(Sender: TObject);
begin
editCEP.Color := clWhite;
end;

procedure Tfrm_Fornecedores.editTelefoneExit(Sender: TObject);
begin
editTelefone.Color := clWhite;
end;

procedure Tfrm_Fornecedores.BitBtn1Click(Sender: TObject);
begin
frm_ConsultaFornecedores := Tfrm_ConsultaFornecedores.Create(Self);
frm_ConsultaFornecedores.ShowModal;
try
finally
frm_ConsultaFornecedores.Free;
frm_ConsultaFornecedores := nil;
end;
end;

procedure Tfrm_Fornecedores.FormShow(Sender: TObject);
begin
  Panel1.Color := cor;
  Panel2.Color := cor - 30;

end;

end.

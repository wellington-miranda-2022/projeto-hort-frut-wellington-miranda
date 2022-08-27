unit frm_ConciliarU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JPEG, ExtCtrls, DB, DBTables, ExtDlgs,
  ComCtrls, Mask, DBCtrls;

type
  Tfrm_Conciliar = class(TForm)
    imImagem: TImage;
    btnSair: TSpeedButton;
    lblProcurar: TLabel;
    ds: TDataSource;
    tbl_Movimentacoes: TTable;
    tbl_MovimentacoesCod_Movimentacao: TAutoIncField;
    tbl_MovimentacoesId_Movimentacao: TIntegerField;
    tbl_MovimentacoesData_Movimentacao: TDateField;
    tbl_MovimentacoesHistorico_Movimentacao: TStringField;
    tbl_MovimentacoesDebito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesCredito_Movimentacao: TCurrencyField;
    tbl_MovimentacoesConciliado_Movimentacao: TStringField;
    tbl_MovimentacoesData_FinalMovimentacao: TDateField;
    tbl_MovimentacoesExtrato_Movimentacao: TGraphicField;
    tbl_MovimentacoesDocumento_Movimentacao: TStringField;
    tbl_MovimentacoesPlanoConta_Movimentacao: TStringField;
    StatusBar1: TStatusBar;
    btnSalvar: TSpeedButton;
    Image1: TImage;
    btnLimpar: TSpeedButton;
    tbl_MovimentacoesFoto_Movimentacao: TStringField;
    opImagem: TOpenPictureDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure imImagemClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarImagem;
    procedure Limpar;
    procedure Conciliar;
    public
    { Public declarations }
  end;

var
  frm_Conciliar: Tfrm_Conciliar;

implementation

uses movimentacoesU, ajustesU, loginU;

{$R *.dfm}

procedure Tfrm_Conciliar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Self.Close;
end;

procedure Tfrm_Conciliar.btnSairClick(Sender: TObject);
begin
Self.Close;
end;

procedure Tfrm_Conciliar.CarregarImagem;
var
jpg : TJPEGImage;
stream : TMemoryStream;
Path : String;

begin

if not (tbl_MovimentacoesFoto_Movimentacao.IsNull)then
begin
  imImagem.Visible := true;
  imImagem.Picture.LoadFromFile(tbl_Movimentacoes.FieldByName('Foto_Movimentacao').Value);
end;
end;


procedure Tfrm_Conciliar.dsDataChange(Sender: TObject; Field: TField);
begin
CarregarImagem;
end;

procedure Tfrm_Conciliar.btnSalvarClick(Sender: TObject);
begin
Conciliar;
tbl_Movimentacoes.FieldByName('Foto_Movimentacao').Value := OpImagem.FileName;
tbl_Movimentacoes.Post;
MessageDlg('Imagem salva com sucesso!',MtInformation,[mbok],0);
Self.Close;
frm_Movimentacao.tbl_Movimentacoes.Refresh;
end;

procedure Tfrm_Conciliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
tbl_Movimentacoes.Active := false;
end;

procedure Tfrm_Conciliar.FormCreate(Sender: TObject);
begin
tbl_Movimentacoes.Active := true;
tbl_Movimentacoes.Locate('Cod_Movimentacao',frm_Movimentacao.tbl_Movimentacoes.FieldByName('Cod_Movimentacao').Value,[]);
tbl_Movimentacoes.Edit;

end;


procedure Tfrm_Conciliar.btnLimparClick(Sender: TObject);
begin
Limpar;
btnSalvar.Enabled := true;
end;

procedure Tfrm_Conciliar.Limpar;
begin
imImagem.Visible := false;
tbl_MovimentacoesFoto_Movimentacao.Clear;


end;


procedure Tfrm_Conciliar.imImagemClick(Sender: TObject);
var
path, dir : String;
begin
path := ExtractFilePath(Application.ExeName);
OpImagem.InitialDir := (path + 'comprovantes recibos');
if opImagem.Execute = true then
begin
  imImagem.Picture.LoadFromFile(opImagem.FileName);
  btnSalvar.Enabled := true;
  end else
if imImagem.Visible = true then
  begin
  btnSalvar.Enabled := false;
  end;
end;

procedure Tfrm_Conciliar.Image1Click(Sender: TObject);
begin
imImagem.Visible := true;
end;

procedure Tfrm_Conciliar.Conciliar;
begin
if imImagem.Visible = false then
begin
tbl_Movimentacoes.FieldByName('Conciliado_Movimentacao').Value := 'N�O';
end else
tbl_Movimentacoes.FieldByName('Conciliado_Movimentacao').Value := 'SIM';
end;

procedure Tfrm_Conciliar.FormShow(Sender: TObject);
begin
  frm_Conciliar.Color :=  cor - 30;
  
end;

end.

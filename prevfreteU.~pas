unit prevfreteU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  Tfrm_PrevFrete = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnSair: TBitBtn;
    editKm: TLabeledEdit;
    editQtd: TLabeledEdit;
    editValor: TLabeledEdit;
    editTotalPrevFrete: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Calcular;
  public
    { Public declarations }
  end;

var
  frm_PrevFrete: Tfrm_PrevFrete;
  

implementation

uses novopedU;

{$R *.dfm}

procedure Tfrm_PrevFrete.SpeedButton2Click(Sender: TObject);
begin
if (editKm.Text = '')or(editQtd.Text = '')or(editValor.Text = '') then
begin
ShowMessage('Campos vazios, verifique!?');
end else
Calcular
end;

procedure Tfrm_PrevFrete.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_PrevFrete.SpeedButton1Click(Sender: TObject);
begin
if (editKm.Text = '')or(editQtd.Text = '')or(editValor.Text = '') then
begin
MessageDlg('Campos vazios, verifique!',MtWarning,[mbok],0);
end else
Calcular;
Close;
frm_NovoPed.Hide;
frm_NovoPed.Show;



end;

procedure Tfrm_PrevFrete.Calcular;
var
qtd : Integer;
km, valor: Real;
begin
km := strtofloat(editKm.Text);
qtd := strtoint(editQtd.Text);
valor := strtofloat(editValor.Text);
totalprevfrete := (qtd / valor) * km;
editTotalPrevFrete.Text := FormatFloat(',,,,.0.0',(totalprevfrete));
end;

procedure Tfrm_PrevFrete.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_ESCAPE then
Close;
end;

end.

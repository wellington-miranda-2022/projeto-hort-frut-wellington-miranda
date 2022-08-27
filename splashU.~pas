unit splashU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, XPMan, jpeg;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses loginU;



{$R *.dfm}
{$INCLUDE ZipVers.inc}
{$IfDef VER140}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$endif}

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
progressbar1.Position := progressbar1.Position + 1;
label1.Caption := inttostr(progressbar1.Position)+'%';

if progressbar1.position = 100 then

begin
frmSplash.Destroy;
frmLogin.Showmodal;
end;
end;
end.

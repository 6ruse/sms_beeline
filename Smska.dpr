program Smska;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uRecentNumber in 'uRecentNumber.pas' {FrmRecentNumber};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

program Youtube_Downloader_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmStyles in 'udmStyles.pas' {dmStyles: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmStyles, dmStyles);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

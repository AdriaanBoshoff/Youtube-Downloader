program Youtube_Downloader_FMX;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmStyles in 'udmStyles.pas' {dmStyles: TDataModule},
  uDownloadListBoxItem in 'uDownloadListBoxItem.pas',
  uCommonFunctions in 'uCommonFunctions.pas';

{$R *.res}

begin
  GlobalUseSkia := True;

  Application.Title := 'Youtube Downloader FMX';

  Application.Initialize;
  Application.CreateForm(TdmStyles, dmStyles);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, udmStyles, FMX.Layouts, FMX.ListBox, FMX.Edit, Skia,
  Skia.FMX, uDownloadListBoxItem;

type
  TfrmMain = class(TForm)
    statMain: TStatusBar;
    tlbMain: TToolBar;
    lytAppVersion: TLayout;
    lblAppVersionValue: TLabel;
    lblAppVersionHeader: TLabel;
    lblDownloadsHeader: TLabel;
    lstDownloads: TListBox;
    lblURLHeader: TLabel;
    edtURL: TEdit;
    btnClearURL: TClearEditButton;
    btnDownloadMP4: TButton;
    btnDownloadMP3: TButton;
    procedure btnDownloadMP3Click(Sender: TObject);
    procedure btnDownloadMP4Click(Sender: TObject);
    procedure OnAppVersionResized(Sender: TObject);
  private
    { Private declarations }
    procedure DownloadMedia(const URL: string; const MediaType: TDownloadMediaType);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnDownloadMP3Click(Sender: TObject);
begin
  DownloadMedia(edtURL.Text.Trim, TDownloadMediaType.mtMP3);
end;

procedure TfrmMain.btnDownloadMP4Click(Sender: TObject);
begin
  DownloadMedia(edtURL.Text.Trim, TDownloadMediaType.mtMP4);
end;

procedure TfrmMain.DownloadMedia(const URL: string; const MediaType: TDownloadMediaType);
begin
  var aItem := TDownloadListBoxItem.Create(lstDownloads);
  aItem.DownloadLink := URL;
  aItem.DownloadMediaType := MediaType;
  lstDownloads.AddObject(aItem);
  aItem.StartDownload;

  edtURL.Text := '';
end;

procedure TfrmMain.OnAppVersionResized(Sender: TObject);
begin
  lytAppVersion.Width := lblAppVersionValue.Width + lblAppVersionHeader.Width + lblAppVersionHeader.Margins.Right;
end;

end.


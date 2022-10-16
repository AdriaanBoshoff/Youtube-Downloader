unit ufrmMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  udmStyles,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Edit;

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
    procedure OnAppVersionResized(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.OnAppVersionResized(Sender: TObject);
begin
  lytAppVersion.Width := lblAppVersionValue.Width + lblAppVersionHeader.Width + lblAppVersionHeader.Margins.Right;
end;

end.


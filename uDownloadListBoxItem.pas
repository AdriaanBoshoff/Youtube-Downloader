unit uDownloadListBoxItem;

interface

uses
  System.UITypes, System.Classes, System.Types, System.SysUtils, FMX.ListBox,
  FMX.Objects, FMX.StdCtrls, FMX.Ani, FMX.Types, FMX.Effects, FMX.Layouts,
  FMX.Graphics, Skia.FMX, FMX.TabControl, System.IOUtils, FMX.ImgList,
  DosCommand;

type
  TDownloadListBoxItem = class(TListBoxItem)
  private
    FBackGround: TRectangle;
    FControlLayout: TLayout;
    FIcon: TImage;
    FlblVideoTitle: TLabel;
    FpbProgress: TProgressBar;
    FlblProgressText: TLabel;
    FbtnCancel: TSpeedButton;
    FdosCMD: TDosCommand;
    // Link
    FDownloadLink: string;
    procedure BackgroundClicked(Sender: TObject);
    procedure OnMouseHover(Sender: TObject);
    procedure OnMouseHoverLeave(Sender: TObject);
  private
    { Property Methods Gets }
    function GetDownloadLink: string;
  private
    { Property Methods Sets }
    procedure SetDownloadLink(const Value: string);
  private
    { DosCommand Events }
    procedure OnNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure OnTerminate(Sender: TObject);
    { Other Events }
    procedure OnCancelClicked(Sender: TObject);
  public
    procedure AfterConstruction; override;
    procedure StartDownload;
  published
    property DownloadLink: string read GetDownloadLink write SetDownloadLink;
  end;

implementation

{ TDownloadListBoxItem }

procedure TDownloadListBoxItem.AfterConstruction;
begin
  inherited;

  { Build Item }
  Self.Padding.Left := 5;
  Self.Padding.Top := 2.5;
  Self.Padding.Right := 5;
  Self.Padding.Bottom := 2.5;
  Self.CanFocus := False;
  Self.DisableFocusEffect := True;
  Self.Selectable := False;
  Self.Height := 50;

  // Background
  FBackGround := TRectangle.Create(Self);
  FBackGround.Parent := Self;
  FBackGround.Fill.Color := $FF1F222A;
  FBackGround.Align := TAlignLayout.Client;
  FBackGround.Sides := [];
  FBackGround.XRadius := 5;
  FBackGround.YRadius := 5;
  FBackGround.HitTest := True;
  FBackGround.OnClick := BackgroundClicked;
  FBackGround.OnMouseEnter := OnMouseHover;
  FBackGround.OnMouseLeave := OnMouseHoverLeave;
  FBackGround.Stroke.Color := $00;
  FBackGround.Name := 'FBackGround';

  // Controls Layout
  FControlLayout := TLayout.Create(FBackGround);
  FControlLayout.Parent := FBackGround;
  FControlLayout.Align := TAlignLayout.Contents;
  FControlLayout.Padding.Top := 5;
  FControlLayout.Padding.Right := 5;
  FControlLayout.Padding.Bottom := 5;
  FControlLayout.Padding.Left := 5;

  // Icon
  FIcon := TImage.Create(FControlLayout);
  FIcon.Parent := FControlLayout;
  FIcon.HitTest := False;
  FIcon.Align := TAlignLayout.MostLeft;
  FIcon.Width := FIcon.Height;
  FIcon.Bitmap.LoadFromFile('C:\Users\adria\Documents\GitHub\Youtube-Downloader\Assets\png\download-48.png');

  // Video Title
  FlblVideoTitle := TLabel.Create(FControlLayout);
  FlblVideoTitle.Parent := FControlLayout;
  FlblVideoTitle.AutoSize := True;
  FlblVideoTitle.TextSettings.WordWrap := True;
  FlblVideoTitle.Align := TAlignLayout.Client;
  FlblVideoTitle.Margins.Left := 5;
  FlblVideoTitle.Margins.Right := 5;
  FlblVideoTitle.Text := 'Video Title / Audio Title' + sLineBreak + 'New line';
  FlblVideoTitle.Font.Style := [TFontStyle.fsBold];
  FlblVideoTitle.StyledSettings := [TStyledSetting.Family, TStyledSetting.FontColor];

  // Progress Bar
  FpbProgress := TProgressBar.Create(FControlLayout);
  FpbProgress.Parent := FControlLayout;
  FpbProgress.Align := TAlignLayout.Right;
  FpbProgress.Width := 400;
  FpbProgress.HitTest := False;
  FpbProgress.Margins.Top := 5;
  FpbProgress.Margins.Right := 5;
  FpbProgress.Margins.Bottom := 5;
  FpbProgress.Min := 0;
  FpbProgress.Max := 100;
  FpbProgress.Value := 50;

  // Progress Text
  FlblProgressText := TLabel.Create(FpbProgress);
  FlblProgressText.Parent := FpbProgress;
  FlblProgressText.Align := TAlignLayout.Contents;
  FlblProgressText.Text := '10MB / 50MB   32mb/s   ETA: 00:30';
  FlblProgressText.StyledSettings := [TStyledSetting.Family, TStyledSetting.FontColor];
  FlblProgressText.TextSettings.HorzAlign := TTextAlign.Center;

  // Cancel Button
  FbtnCancel := TSpeedButton.Create(FControlLayout);
  FbtnCancel.Parent := FControlLayout;
  FbtnCancel.OnClick := OnCancelClicked;
  FbtnCancel.Align := TAlignLayout.MostRight;
  FbtnCancel.Width := FbtnCancel.Height;
  FbtnCancel.StyleLookup := 'stoptoolbuttonbordered';

  // DosCommand
  FdosCMD := TDosCommand.Create(Self);
  FdosCMD.OnNewLine := OnNewLine;
  FdosCMD.OnTerminated := OnTerminate;
end;

procedure TDownloadListBoxItem.BackgroundClicked(Sender: TObject);
begin
  // Handle on click events
  if Assigned(Self.OnClick) then
    Self.OnClick(Self)
  else if Assigned(Self.ListBox.OnItemClick) then
    Self.ListBox.OnItemClick(Self.ListBox, Self);
end;

function TDownloadListBoxItem.GetDownloadLink: string;
begin
  Result := FDownloadLink;
end;

procedure TDownloadListBoxItem.OnCancelClicked(Sender: TObject);
begin
  // Stop dosCommand if running
  if FdosCMD.IsRunning then
    FdosCMD.Stop;

  // Clear bitmap from memory
  FIcon.Bitmap := nil;

  // Delete the listbox item
  FreeAndNil(Self);
end;

procedure TDownloadListBoxItem.OnMouseHover(Sender: TObject);
begin
  // Hover background color
  FBackGround.Fill.Color := TAlphaColorRec.Darkred;
end;

procedure TDownloadListBoxItem.OnMouseHoverLeave(Sender: TObject);
begin
  // Default background color
  FBackGround.Fill.Color := $FF1F222A;
end;

procedure TDownloadListBoxItem.OnNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
//
end;

procedure TDownloadListBoxItem.OnTerminate(Sender: TObject);
begin
//
end;

procedure TDownloadListBoxItem.SetDownloadLink(const Value: string);
begin
  FDownloadLink := Value;
end;

procedure TDownloadListBoxItem.StartDownload;
begin
  // Check if download link is empty
  if FDownloadLink.Trim.IsEmpty then
    Exit;
end;

end.


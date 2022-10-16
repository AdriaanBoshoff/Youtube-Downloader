unit uDownloadListBoxItem;

interface

uses
  System.UITypes, System.Classes, System.Types, System.SysUtils, FMX.ListBox,
  FMX.Objects, FMX.StdCtrls, FMX.Ani, FMX.Types, FMX.Effects, FMX.Layouts,
  FMX.Graphics, Skia.FMX, FMX.TabControl, System.IOUtils, FMX.ImgList;

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
    procedure BackgroundClicked(Sender: TObject);
    procedure OnMouseHover(Sender: TObject);
    procedure OnMouseHoverLeave(Sender: TObject);
  private
    { Property Methods Gets }
  private
    { Property Methods Sets }
  public
    procedure AfterConstruction; override;
  published
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
  FlblVideoTitle.Text := 'Video Title / Audio Title';
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
  FlblProgressText.Text := '10MB / 50MB   ETA: 00:30   32mb/s';
  FlblProgressText.StyledSettings := [TStyledSetting.Family];
 // FlblProgressText.Font.Style := [TFontStyle.fsBold];
  FlblProgressText.TextSettings.HorzAlign := TTextAlign.Center;
  FlblProgressText.FontColor := TAlphaColorRec.Lightgray;

  // Cancel Button
  FbtnCancel := TSpeedButton.Create(FControlLayout);
  FbtnCancel.Parent := FControlLayout;
  FbtnCancel.Align := TAlignLayout.MostRight;
  FbtnCancel.Width := FbtnCancel.Height;
  FbtnCancel.StyleLookup := 'stoptoolbuttonbordered';
end;

procedure TDownloadListBoxItem.BackgroundClicked(Sender: TObject);
begin
  if Assigned(Self.OnClick) then
    Self.OnClick(Self)
  else if Assigned(Self.ListBox.OnItemClick) then
    Self.ListBox.OnItemClick(Self.ListBox, Self);
end;

procedure TDownloadListBoxItem.OnMouseHover(Sender: TObject);
begin
  FBackGround.Fill.Color := TAlphaColorRec.Darkred;
end;

procedure TDownloadListBoxItem.OnMouseHoverLeave(Sender: TObject);
begin
  FBackGround.Fill.Color := $FF1F222A;
end;

end.


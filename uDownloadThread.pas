unit uDownloadThread;

interface

uses
  System.Classes;

type
  TDownloadThread = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

{ TDownloadThread }

procedure TDownloadThread.Execute;
begin
  NameThreadForDebugging('DownloadThread');
  { Place thread code here }
end;

end.

unit uCommonFunctions;

interface

uses
  System.Math, System.SysUtils;

function ConvertBytes(Bytes: Int64): string;

implementation

function ConvertBytes(Bytes: Int64): string;
const
  Description: array[0..8] of string = ('Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
var
  i: Integer;
begin
  i := 0;

  while Bytes > Power(1024, i + 1) do
    Inc(i);

  Result := FormatFloat('###0.##', Bytes / IntPower(1024, i)) + ' ' + Description[i];
end;

end.


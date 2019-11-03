unit i_update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URLMon, ShellApi, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function DownloadFile(Zdroj, Cil: string): Boolean; 
begin 
try 
  Result := UrlDownloadToFile(nil, PChar(Zdroj), PChar(Cil), 0, nil) = 0;
except 
  Result := False;
end; 
end; 

procedure TForm1.Button1Click(Sender: TObject);
const 
ZdrojovySoubor = 'C:\Documents and Settings\xxx\Dokumenty\extract.txt';
CilovySoubor  = 'C:\Documents and Settings\xxx\Dokumenty\Project2.exe';
begin 
  DownloadFile (ZdrojovySoubor, CilovySoubor);
  ShellExecute(Handle, 'open', pchar('Project2.exe'), nil, nil, SW_SHOWNORMAL);
  application.Terminate;
end;

end.

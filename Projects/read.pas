unit read;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
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

procedure TForm1.Button1Click(Sender: TObject);
begin
     Memo1.Lines.LoadFromFile('C:\Program Files\wamp\www\version.txt');
     if Memo1.text < '15'
     then begin ShowMessage('Men��') end
     else ShowMessage('V�t��');
end;

end.
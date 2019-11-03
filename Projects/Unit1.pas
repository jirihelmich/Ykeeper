unit Unit1;

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
     if FileExists ('version.txt')then
                begin
             Memo1.Lines.LoadFromFile('version.txt');
             if (Memo1.text < '1.0.2') AND (Memo1.text > '1.0.0')
                     then begin ShowMessage('10-15') end
             else ShowMessage('Jinak');
             end
end;

end.

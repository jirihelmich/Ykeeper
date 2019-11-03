unit label_changew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TrayIkona, Menus, ExtCtrls, jpeg, mysql, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure xyz(Sender: TObject);
    procedure zzz(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MachineName: String;
var
  Machine : PChar;
  i    : DWord;
begin
  i := 1024;
  machine := StrAlloc(Succ(i));
  if GetComputerName(Machine, i) then Result := StrPas(Machine)
                          else Result := 'Žádný';
end;

function UserName: String;
var
  User : PChar;
  i    : DWord;
begin
  i := 1024;
  user := StrAlloc(Succ(i));
  if GetUserName(User, i) then Result := StrPas(User)
                          else Result := 'Žádný';
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
label2.Caption:=UserName;
label6.Caption:=MachineName;
label4.caption:=FormatDateTime('yyyy"/"mm"/"dd', Now);
label9.caption:=FormatDateTime('tt', Now);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    Form1.Hide;
end;

procedure TForm1.xyz(Sender: TObject);
begin
 Form1.Hide;
end;

procedure TForm1.zzz(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var Phantom: PMYSQL;
begin
Phantom := mysql_init(nil);
mysql_connect(Phantom, pChar('xerius'), pChar('helmich'), pChar('mhjhasd'));
mysql_select_db(Phantom, pChar('helmich'));
mysql_query(Phantom, PChar('insert into yreport values("'+UserName+'", "'+MachineName+'", "'+label4.Caption+'", "'+label9.Caption+'", "'+Memo1.Text+'")'));
mysql_close(Phantom);
Memo1.Text:='Díky, zpráva byla uložena!';
Memo1.Enabled:=False;
end;

end.

unit label_changew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TrayIkona, Menus, ExtCtrls, jpeg, mysql;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    Zavtprogram1: TMenuItem;
    Image1: TImage;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure xyz(Sender: TObject);
    procedure zzz(Sender: TObject);
    procedure refresh_db(Sender: TObject);
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
                          else Result := '��dn�';
end;

function UserName: String;
var
  User : PChar;
  i    : DWord;
begin
  i := 1024;
  user := StrAlloc(Succ(i));
  if GetUserName(User, i) then Result := StrPas(User)
                          else Result := '��dn�';
end;


procedure TForm1.FormCreate(Sender: TObject);
var Phantom: PMYSQL;
begin
label2.Caption:=UserName;
label6.Caption:=MachineName;
label4.caption:=FormatDateTime('yyyy"/"mm"/"dd', Now);
label9.caption:=FormatDateTime('yyyy"/"mm"/"dd" "hh":"nn":"ss', Now);
label8.caption:=FormatDateTime('yyyy"/"mm"/"dd" "hh":"nn":"ss', Now);

Phantom := mysql_init(nil);
mysql_connect(Phantom, pChar('xerius'), pChar('helmich'), pChar('mhjhasd'));
mysql_select_db(Phantom, pChar('helmich'));
mysql_query(Phantom, PChar('insert into y values("'+UserName+'", "'+MachineName+'", "'+label4.Caption+'", "'+label9.Caption+'", "'+label8.Caption+'")'));
mysql_close(Phantom);
end;

procedure TForm1.xyz(Sender: TObject);
begin
 Form1.Hide;
 Timer1.Enabled:=False;
end;

procedure TForm1.zzz(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.refresh_db(Sender: TObject);
var Phantom: PMYSQL;
begin
label8.caption:=FormatDateTime('yyyy"/"mm"/"dd" "hh":"nn":"ss', Now);
Phantom := mysql_init(nil);
mysql_connect(Phantom, pChar('xerius'), pChar('helmich'), pChar('mhjhasd'));
mysql_select_db(Phantom, pChar('helmich'));
mysql_query(Phantom, PChar('update y set last_check = "'+label8.Caption+'" WHERE  user = "'+UserName+'" AND machine = "'+MachineName+'" AND date = "'+label4.Caption+'" AND time = "'+label9.Caption+'"'));
mysql_close(Phantom);
end;

end.

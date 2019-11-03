program i_update_updater;

uses
  Forms,
  i_update in 'i_update.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program PCT_drv;

uses
  Forms,
  PCT_driver in 'PCT_driver.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'http://www.pctuning.cz';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

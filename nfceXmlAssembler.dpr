program nfceXmlAssembler;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FMain};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Montador de XML de NFCe';
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.

unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, ACBrBase, ACBrDFe, ACBrNFe, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.AppEvnts;

type
  TFMain = class(TForm)
    ACBrNFe: TACBrNFe;
    pgControlFuncoes: TPageControl;
    tabPrincipal: TTabSheet;
    tabConfiguracoes: TTabSheet;
    cbFormaEmissao: TComboBox;
    cbModeloDF: TComboBox;
    cbVersaoDF: TComboBox;
    lbVersaoDF: TLabel;
    lbModeloDF: TLabel;
    lbFormaEmissao: TLabel;
    cbSSLLib: TComboBox;
    lbSSLLib: TLabel;
    lbCryptLib: TLabel;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    lbHttpLib: TLabel;
    lbXmlSign: TLabel;
    cbXmlSignLib: TComboBox;
    cbSSLType: TComboBox;
    lbSSLType: TLabel;
    cbUF: TComboBox;
    lbSelecionarUF: TLabel;
    rgTipoAmb: TRadioGroup;
    btSalvarConfiguracoes: TButton;
    lbCaminho: TLabel;
    edCaminho: TEdit;
    sbCaminhoCert: TSpeedButton;
    edSenha: TEdit;
    lbSenha: TLabel;
    ApplicationEvents: TApplicationEvents;
    pnUsuario: TPanel;
    lbCaminhoXML: TLabel;
    edCaminhoXML: TEdit;
    sbBuscaXML: TSpeedButton;
    btLerXML: TButton;
    Label33: TLabel;
    edtIdToken: TEdit;
    Label34: TLabel;
    edtToken: TEdit;
    pnLogsRetorno: TPanel;
    Splitter1: TSplitter;
    pnLogsSEFAZ: TPanel;
    lbLogRespostaSEFAZ: TLabel;
    mmRespostaSEFAZ: TMemo;
    pnLogsApp: TPanel;
    lbLogRespostaApp: TLabel;
    mmRespostaApp: TMemo;
    pnPrincipalClient: TPanel;
    pnBackgroundSbDadosConsulta: TPanel;
    lbDadosConsulta: TLabel;
    sbDadosConsulta: TScrollBox;
    pnBackgroundSbDadosXML: TPanel;
    lbDadosXML: TLabel;
    sbDadosXML: TScrollBox;
    sptInfos: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure btSalvarConfiguracoesClick(Sender: TObject);
    procedure sbCaminhoCertClick(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: TMsg; var Handled: Boolean);
    procedure sbBuscaXMLClick(Sender: TObject);
    procedure btLerXMLClick(Sender: TObject);
  private
    procedure ConfigurarComponente;
    procedure SalvarConfiguracoes;
    procedure LerConfiguracoes;
    procedure CriarLabel(ALabel, AValor: String; AParent: TWinControl);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses
  ACBrDFeSSL, pcnConversao, pcnConversaoNFe, System.TypInfo, blcksock,
  System.IniFiles, Winapi.ShellAPI, System.StrUtils, pcnProcNFe,
  ACBrUtil.XMLHTML, pcnRetConsReciDFe;

procedure TFMain.ConfigurarComponente;
var
  LOK: Boolean;
begin
  ACBrNFe.Configuracoes.Certificados.ArquivoPFX := edCaminho.Text;
  ACBrNFe.Configuracoes.Certificados.Senha := AnsiString(edSenha.Text);

  ACBrNFe.SSL.DescarregarCertificado;

  ACBrNFe.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  ACBrNFe.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  ACBrNFe.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  ACBrNFe.Configuracoes.Geral.SSLXmlSignLib :=
    TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

  ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := True;
  ACBrNFe.Configuracoes.Geral.Salvar := True;
  ACBrNFe.Configuracoes.Geral.ExibirErroSchema := True;
  ACBrNFe.Configuracoes.Geral.RetirarAcentos := True;

  ACBrNFe.Configuracoes.Geral.FormaEmissao :=
    TpcnTipoEmissao(cbFormaEmissao.ItemIndex);
  ACBrNFe.Configuracoes.Geral.ModeloDF := TpcnModeloDF(cbModeloDF.ItemIndex);
  ACBrNFe.Configuracoes.Geral.VersaoDF := TpcnVersaoDF(cbVersaoDF.ItemIndex);

  ACBrNFe.Configuracoes.Geral.VersaoQRCode := veqr200;
  ACBrNFe.Configuracoes.Geral.IdCSC := edtIdToken.Text;
  ACBrNFe.Configuracoes.Geral.CSC := edtToken.Text;

  ACBrNFe.Configuracoes.WebServices.Ambiente :=
    StrToTpAmb(LOK, IntToStr(rgTipoAmb.ItemIndex + 1));
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  T: TSSLLib;
  I: TpcnTipoEmissao;
  J: TpcnModeloDF;
  K: TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
begin
  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add(GetEnumName(TypeInfo(TSSLLib), integer(T)));
  cbSSLLib.ItemIndex := 4;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add(GetEnumName(TypeInfo(TSSLCryptLib), integer(U)));
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add(GetEnumName(TypeInfo(TSSLHttpLib), integer(V)));
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add(GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X)));
  cbXmlSignLib.ItemIndex := 0;

  cbSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add(GetEnumName(TypeInfo(TSSLType), integer(Y)));
  cbSSLType.ItemIndex := 5;

  cbFormaEmissao.Items.Clear;
  for I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
    cbFormaEmissao.Items.Add(GetEnumName(TypeInfo(TpcnTipoEmissao),
      integer(I)));
  cbFormaEmissao.ItemIndex := 0;

  cbModeloDF.Items.Clear;
  for J := Low(TpcnModeloDF) to High(TpcnModeloDF) do
    cbModeloDF.Items.Add(GetEnumName(TypeInfo(TpcnModeloDF), integer(J)));
  cbModeloDF.ItemIndex := 0;

  cbVersaoDF.Items.Clear;
  for K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
    cbVersaoDF.Items.Add(GetEnumName(TypeInfo(TpcnVersaoDF), integer(K)));
  cbVersaoDF.ItemIndex := 0;

  LerConfiguracoes;

  DragAcceptFiles(edCaminhoXML.Handle, True);
end;

procedure TFMain.SalvarConfiguracoes;
var
  LFilePath: String;
  LIniFile: TIniFile;
begin
  LFilePath := ChangeFileExt(ParamStr(0), '.ini');

  LIniFile := TIniFile.Create(LFilePath);

  try
    LIniFile.WriteInteger('Certificado', 'SSLLib', cbSSLLib.ItemIndex);
    LIniFile.WriteInteger('Certificado', 'CryptLib', cbCryptLib.ItemIndex);
    LIniFile.WriteInteger('Certificado', 'HttpLib', cbHttpLib.ItemIndex);
    LIniFile.WriteInteger('Certificado', 'XmlSignLib', cbXmlSignLib.ItemIndex);
    LIniFile.WriteString('Certificado', 'Caminho', edCaminho.Text);
    LIniFile.WriteString('Certificado', 'Senha', edSenha.Text);

    LIniFile.WriteInteger('Geral', 'FormaEmissao', cbFormaEmissao.ItemIndex);
    LIniFile.WriteInteger('Geral', 'ModeloDF', cbModeloDF.ItemIndex);
    LIniFile.WriteInteger('Geral', 'VersaoDF', cbVersaoDF.ItemIndex);
    LIniFile.WriteString('Geral', 'IdToken', edtIdToken.Text);
    LIniFile.WriteString('Geral', 'Token', edtToken.Text);

    LIniFile.WriteString('WebService', 'UF', cbUF.Text);
    LIniFile.WriteInteger('WebService', 'Ambiente', rgTipoAmb.ItemIndex);
    LIniFile.WriteInteger('WebService', 'SSLType', cbSSLType.ItemIndex);
  finally
    LIniFile.Free;
  end;
end;

procedure TFMain.sbBuscaXMLClick(Sender: TObject);
var
  LOpenDialog: TOpenDialog;
begin
  LOpenDialog := TOpenDialog.Create(FMain);

  try
    LOpenDialog.Title := 'Selecione o xml';
    LOpenDialog.DefaultExt := '*.xml';
    LOpenDialog.Filter :=
      'Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.*)|*.*';

    LOpenDialog.InitialDir := ParamStr(0);

    if LOpenDialog.Execute then
      edCaminhoXML.Text := LOpenDialog.FileName;
  finally
    LOpenDialog.Free;
  end;
end;

procedure TFMain.sbCaminhoCertClick(Sender: TObject);
var
  LOpenDialog: TOpenDialog;
begin
  LOpenDialog := TOpenDialog.Create(FMain);

  try
    LOpenDialog.Title := 'Selecione o Certificado';
    LOpenDialog.DefaultExt := '*.pfx';
    LOpenDialog.Filter :=
      'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';

    LOpenDialog.InitialDir := ParamStr(0);

    if LOpenDialog.Execute then
      edCaminho.Text := LOpenDialog.FileName;
  finally
    LOpenDialog.Free;
  end;
end;

procedure TFMain.ApplicationEventsMessage(var Msg: TMsg; var Handled: Boolean);
  function _ReadFile(var Msg: TMsg): String;
  var
    hDrop: THandle;
    LFileCount: integer;
    LNameLen: integer;
    I: integer;
  begin
    hDrop := Msg.wParam;
    LFileCount := DragQueryFile(hDrop, $FFFFFFFF, nil, 0);

    for I := 0 to LFileCount - 1 do
    begin
      LNameLen := DragQueryFile(hDrop, I, nil, 0) + 1;
      SetLength(Result, LNameLen);
      DragQueryFile(hDrop, I, Pointer(Result), LNameLen);
    end;

    DragFinish(hDrop);
  end;

begin
  if ((Msg.message = WM_DROPFILES) and (Msg.hwnd = edCaminhoXML.Handle)) then
  begin
    edCaminhoXML.Text := _ReadFile(Msg);
  end;
end;

procedure TFMain.btSalvarConfiguracoesClick(Sender: TObject);
begin
  SalvarConfiguracoes;
end;

procedure TFMain.LerConfiguracoes;
var
  LFilePath: String;
  LIniFile: TIniFile;
begin
  LFilePath := ChangeFileExt(ParamStr(0), '.ini');

  LIniFile := TIniFile.Create(LFilePath);
  try
    cbSSLLib.ItemIndex := LIniFile.ReadInteger('Certificado', 'SSLLib', 4);
    cbCryptLib.ItemIndex := LIniFile.ReadInteger('Certificado', 'CryptLib', 0);
    cbHttpLib.ItemIndex := LIniFile.ReadInteger('Certificado', 'HttpLib', 0);
    cbXmlSignLib.ItemIndex := LIniFile.ReadInteger('Certificado',
      'XmlSignLib', 0);

    edCaminho.Text := LIniFile.ReadString('Certificado', 'Caminho', '');
    edSenha.Text := LIniFile.ReadString('Certificado', 'Senha', '');

    cbFormaEmissao.ItemIndex := LIniFile.ReadInteger('Geral',
      'FormaEmissao', 0);
    cbModeloDF.ItemIndex := LIniFile.ReadInteger('Geral', 'ModeloDF', 0);
    cbVersaoDF.ItemIndex := LIniFile.ReadInteger('Geral', 'VersaoDF', 0);
    edtIdToken.Text := LIniFile.ReadString('Geral', 'IdToken', '');
    edtToken.Text := LIniFile.ReadString('Geral', 'Token', '');

    cbUF.ItemIndex := cbUF.Items.IndexOf(LIniFile.ReadString('WebService',
      'UF', 'SP'));
    rgTipoAmb.ItemIndex := LIniFile.ReadInteger('WebService', 'Ambiente', 0);
    cbSSLType.ItemIndex := LIniFile.ReadInteger('WebService', 'SSLType', 5);

    ConfigurarComponente;
  finally
    LIniFile.Free;
  end;
end;

procedure TFMain.CriarLabel(ALabel: String; AValor: String;
  AParent: TWinControl);
var
  LLabel: TLabel;
  LValor: TLabel;
begin
  LValor := TLabel.Create(FMain);
  LValor.Parent := AParent;
  LValor.Align := TAlign.alTop;
  LValor.AlignWithMargins := True;
  LValor.Margins.Top := 5;
  LValor.Margins.Left := 5;
  LValor.Margins.Right := 5;
  LValor.Caption := AValor;
  LValor.Font.Style := [];

  LLabel := TLabel.Create(FMain);
  LLabel.Parent := AParent;
  LLabel.Align := TAlign.alTop;
  LLabel.AlignWithMargins := True;
  LLabel.Margins.Top := 5;
  LLabel.Margins.Left := 5;
  LLabel.Margins.Right := 5;
  LLabel.Caption := ALabel;
  LLabel.Font.Style := [TFontStyle.fsBold];
end;

procedure TFMain.btLerXMLClick(Sender: TObject);
var
  I: integer;
  AChave: String;
  AInfProtVersao: String;
  ANomeArquivo: String;
  AInfProt: TProtDFeCollection;
  AInfProtItem: TProtDFeCollectionItem;
  AProcNFe: TProcNFe;

  function _GetCoalesce(AString: String): String;
  begin
    Result := IfThen(AString.IsEmpty, 'Sem valor informado', AString);
  end;

  function _NumbersOnly(AString: String): String;
  var
    I: integer;
  begin
    Result := '';
    for I := 1 to length(AString) do
    begin
      if CharInSet(AString[I], ['0' .. '9']) then
        Result := Result + AString[I];
    end;
  end;

begin
  mmRespostaSEFAZ.Clear;
  mmRespostaApp.Clear;

  for I := sbDadosXML.ControlCount - 1 downto 0 do
    sbDadosXML.Controls[I].Free;

  try
    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromFile(edCaminhoXML.Text);

    AChave := _NumbersOnly(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.Id);

    CriarLabel('Dest -> CNPJCPF',
      _GetCoalesce(ACBrNFe.NotasFiscais.Items[0].NFe.Dest.CNPJCPF), sbDadosXML);

    CriarLabel('Dest -> xNome',
      _GetCoalesce(ACBrNFe.NotasFiscais.Items[0].NFe.Dest.xNome), sbDadosXML);

    CriarLabel('Emit -> CNPJCPF',
      _GetCoalesce(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF), sbDadosXML);

    CriarLabel('Emit -> xNome',
      _GetCoalesce(ACBrNFe.NotasFiscais.Items[0].NFe.Emit.xNome), sbDadosXML);

    CriarLabel('infNFe -> Id', AChave, sbDadosXML);

    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.WebServices.Consulta.NFeChave := AChave;

    ACBrNFe.WebServices.Consulta.Executar;

    mmRespostaSEFAZ.Lines.Add(ACBrNFe.WebServices.Consulta.RetWS);

    AInfProt := TProtDFeCollection.Create;

    AInfProtItem := TProtDFeCollectionItem.Create;

    try
      AInfProt.Add(AInfProtItem);
      AInfProt.Items[0].tpAmb := ACBrNFe.WebServices.Consulta.protNFe.tpAmb;
      AInfProt.Items[0].verAplic :=
        ACBrNFe.WebServices.Consulta.protNFe.verAplic;
      AInfProt.Items[0].chDFe := ACBrNFe.WebServices.Consulta.protNFe.chNFe;
      AInfProt.Items[0].dhRecbto :=
        ACBrNFe.WebServices.Consulta.protNFe.dhRecbto;
      AInfProt.Items[0].nProt := ACBrNFe.WebServices.Consulta.protNFe.nProt;
      AInfProt.Items[0].digVal := ACBrNFe.WebServices.Consulta.protNFe.digVal;
      AInfProt.Items[0].xMotivo := ACBrNFe.WebServices.Consulta.protNFe.xMotivo;
      AInfProt.Items[0].cStat := ACBrNFe.WebServices.Consulta.protNFe.cStat;

      CriarLabel('xMotivo', _GetCoalesce(AInfProt.Items[0].xMotivo),
        sbDadosConsulta);

      CriarLabel('cStat', IntToStr(AInfProt.Items[0].cStat), sbDadosConsulta);

      CriarLabel('digVal', AInfProt.Items[0].digVal, sbDadosConsulta);

      CriarLabel('nProt', AInfProt.Items[0].nProt, sbDadosConsulta);

      CriarLabel('dhRecebto',
        _GetCoalesce(DateTimeToStr(AInfProt.Items[0].dhRecbto)),
        sbDadosConsulta);

      CriarLabel('chNFe', _GetCoalesce(AInfProt.Items[0].chDFe),
        sbDadosConsulta);

      CriarLabel('verAplic', _GetCoalesce(AInfProt.Items[0].verAplic),
        sbDadosConsulta);

      CriarLabel('tpAmb', _GetCoalesce(TpAmbToStr(AInfProt.Items[0].tpAmb)),
        sbDadosConsulta);

      ACBrNFe.WebServices.Consulta.protNFe.PathNFe := edCaminhoXML.Text;
      ACBrNFe.WebServices.Consulta.protNFe.GerarXML;

      AInfProt.Items[0].XMLprotDFe :=
        ACBrNFe.WebServices.Consulta.protNFe.XML_prot;

      AInfProtVersao := ACBrNFe.WebServices.Consulta.protNFe.Versao;

      ACBrNFe.WebServices.Consulta.Clear;

      ACBrNFe.NotasFiscais.LoadFromFile(edCaminhoXML.Text);

      if (AInfProt.Items[0].cStat = 100) or (AInfProt.Items[0].cStat = 110) or
        (AInfProt.Items[0].cStat = 150) or (AInfProt.Items[0].cStat = 301) or
        (AInfProt.Items[0].cStat = 302) or (AInfProt.Items[0].cStat = 303) then
      begin
        AProcNFe := TProcNFe.Create;

        AProcNFe.tpAmb := AInfProt.Items[0].tpAmb;
        AProcNFe.verAplic := AInfProt.Items[0].verAplic;
        AProcNFe.chNFe := AInfProt.Items[0].chDFe;
        AProcNFe.dhRecbto := AInfProt.Items[0].dhRecbto;
        AProcNFe.nProt := AInfProt.Items[0].nProt;
        AProcNFe.digVal := AInfProt.Items[0].digVal;
        AProcNFe.xMotivo := AInfProt.Items[0].xMotivo;
        AProcNFe.cStat := AInfProt.Items[0].cStat;

        try
          AProcNFe.XML_NFe := RemoverDeclaracaoXML
            (ACBrNFe.NotasFiscais.Items[0].XMLAssinado);
          AProcNFe.XML_prot := AInfProt.Items[0].XMLprotDFe;
          AProcNFe.Versao := AInfProtVersao;
          AProcNFe.GerarXML;

          ACBrNFe.NotasFiscais.Items[0].NFe.procNFe := AProcNFe;

          ACBrNFe.NotasFiscais.Items[0].XMLOriginal :=
            AProcNFe.Gerador.ArquivoFormatoXML;

          ANomeArquivo := AInfProt.Items[0].chDFe + '-nfe.xml';

          try
            ACBrNFe.NotasFiscais.Items[0].Assinar;
            ACBrNFe.NotasFiscais.Items[0].Validar;
          except
            on E: Exception do
            begin
              mmRespostaApp.Lines.Add(E.message);
            end;
          end;

          if not ACBrNFe.NotasFiscais.Items[0].ErroValidacao.IsEmpty then
            mmRespostaApp.Lines.Add(ACBrNFe.NotasFiscais.Items[0]
              .ErroValidacao);

          ACBrNFe.Gravar(ANomeArquivo, ACBrNFe.NotasFiscais.Items[0]
            .XMLOriginal);

          mmRespostaApp.Lines.Add('XML salvo em: /Docs/' + AInfProt.Items[0]
            .chDFe + '-nfe.xml');
        finally
          AProcNFe.Free;
        end;
      end;
    finally
      AInfProt.Free;
    end;

    mmRespostaSEFAZ.Lines.Add(ACBrNFe.WebServices.Consulta.RetWS);
  except
    on E: Exception do
    begin
      mmRespostaSEFAZ.Clear;
      mmRespostaSEFAZ.Lines.Add(Trim(E.message));
    end;
  end;
end;

end.

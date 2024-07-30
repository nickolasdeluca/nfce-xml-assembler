object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Montador de XML de NFCe'
  ClientHeight = 615
  ClientWidth = 996
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pgControlFuncoes: TPageControl
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 986
    Height = 605
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tabPrincipal
    Align = alClient
    TabOrder = 0
    object tabPrincipal: TTabSheet
      Caption = 'Principal'
      object pnUsuario: TPanel
        Left = 0
        Top = 0
        Width = 978
        Height = 105
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnUsuario'
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          978
          105)
        object lbCaminhoXML: TLabel
          Left = 15
          Top = 14
          Width = 93
          Height = 15
          Caption = 'Caminho do XML'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object sbBuscaXML: TSpeedButton
          Left = 723
          Top = 29
          Width = 23
          Height = 24
          Anchors = [akTop, akRight]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          OnClick = sbBuscaXMLClick
        end
        object edCaminhoXML: TEdit
          Left = 15
          Top = 30
          Width = 702
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object btLerXML: TButton
          Left = 15
          Top = 59
          Width = 201
          Height = 25
          Caption = 'Realizar consulta e alterar XML'
          TabOrder = 1
          OnClick = btLerXMLClick
        end
      end
      object pnLogsRetorno: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 432
        Width = 978
        Height = 143
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvLowered
        Caption = 'pnLogsRetorno'
        ShowCaption = False
        TabOrder = 1
        ExplicitTop = 472
        ExplicitWidth = 996
        object Splitter1: TSplitter
          Left = 485
          Top = 1
          Width = 11
          Height = 141
          Align = alRight
          Beveled = True
          Color = clBtnFace
          ParentColor = False
          ExplicitLeft = 481
          ExplicitTop = 0
          ExplicitHeight = 143
        end
        object pnLogsSEFAZ: TPanel
          Left = 1
          Top = 1
          Width = 484
          Height = 141
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnLogsSEFAZ'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 472
          ExplicitHeight = 143
          object lbLogRespostaSEFAZ: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 478
            Height = 21
            Align = alTop
            Caption = 'Log de resposta da SEFAZ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 192
          end
          object mmRespostaSEFAZ: TMemo
            AlignWithMargins = True
            Left = 5
            Top = 27
            Width = 474
            Height = 109
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            BevelKind = bkTile
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitLeft = 0
            ExplicitWidth = 472
            ExplicitHeight = 116
          end
        end
        object pnLogsApp: TPanel
          Left = 496
          Top = 1
          Width = 481
          Height = 141
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnLogsApp'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          ExplicitLeft = 497
          ExplicitTop = 0
          ExplicitHeight = 143
          object lbLogRespostaApp: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 475
            Height = 21
            Align = alTop
            Caption = 'Log de Resposta da aplica'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 223
          end
          object mmRespostaApp: TMemo
            AlignWithMargins = True
            Left = 5
            Top = 27
            Width = 471
            Height = 109
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            BevelKind = bkTile
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitLeft = 3
            ExplicitWidth = 473
            ExplicitHeight = 116
          end
        end
      end
      object pnPrincipalClient: TPanel
        Left = 0
        Top = 105
        Width = 978
        Height = 327
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'pnPrincipalClient'
        ShowCaption = False
        TabOrder = 2
        ExplicitLeft = 400
        ExplicitTop = 264
        ExplicitWidth = 185
        ExplicitHeight = 41
        object sptInfos: TSplitter
          Left = 485
          Top = 1
          Width = 11
          Height = 325
          Align = alRight
          Beveled = True
          Color = clBtnFace
          ParentColor = False
          ExplicitLeft = 493
          ExplicitTop = 2
        end
        object pnBackgroundSbDadosConsulta: TPanel
          AlignWithMargins = True
          Left = 496
          Top = 1
          Width = 481
          Height = 325
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnBackgroundSbDadosConsulta'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          ExplicitLeft = 497
          ExplicitTop = 2
          object lbDadosConsulta: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 475
            Height = 21
            Align = alTop
            Caption = 'Informa'#231#245'es da consulta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 187
          end
          object sbDadosConsulta: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 27
            Width = 481
            Height = 298
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
        object pnBackgroundSbDadosXML: TPanel
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 484
          Height = 325
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnBackgroundSbDadosXML'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 1
          ExplicitLeft = 9
          ExplicitTop = 2
          ExplicitWidth = 495
          object lbDadosXML: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 478
            Height = 21
            Align = alTop
            Caption = 'Informa'#231#245'es do XML'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 156
          end
          object sbDadosXML: TScrollBox
            AlignWithMargins = True
            Left = 0
            Top = 27
            Width = 484
            Height = 298
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitWidth = 495
          end
        end
      end
    end
    object tabConfiguracoes: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object lbVersaoDF: TLabel
        Left = 11
        Top = 104
        Width = 132
        Height = 15
        Caption = 'Vers'#227'o Documento Fiscal'
      end
      object lbModeloDF: TLabel
        Left = 11
        Top = 57
        Width = 139
        Height = 15
        Caption = 'Modelo Documento Fiscal'
      end
      object lbFormaEmissao: TLabel
        Left = 11
        Top = 11
        Width = 96
        Height = 15
        Caption = 'Forma de Emiss'#227'o'
      end
      object lbSSLLib: TLabel
        Left = 272
        Top = 11
        Width = 34
        Height = 15
        Alignment = taRightJustify
        Caption = 'SSLLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lbCryptLib: TLabel
        Left = 272
        Top = 57
        Width = 45
        Height = 15
        Alignment = taRightJustify
        Caption = 'CryptLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lbHttpLib: TLabel
        Left = 272
        Top = 104
        Width = 40
        Height = 15
        Alignment = taRightJustify
        Caption = 'HttpLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lbXmlSign: TLabel
        Left = 272
        Top = 151
        Width = 63
        Height = 15
        Alignment = taRightJustify
        Caption = 'XMLSignLib'
        Color = clBtnFace
        ParentColor = False
      end
      object lbSSLType: TLabel
        Left = 448
        Top = 151
        Width = 41
        Height = 15
        Alignment = taRightJustify
        Caption = 'SSLType'
        Color = clBtnFace
        ParentColor = False
      end
      object lbSelecionarUF: TLabel
        Left = 448
        Top = 12
        Width = 126
        Height = 13
        Caption = 'Selecione UF do Emitente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbCaminho: TLabel
        Left = 711
        Top = 14
        Width = 49
        Height = 15
        Caption = 'Caminho'
      end
      object sbCaminhoCert: TSpeedButton
        Left = 938
        Top = 30
        Width = 23
        Height = 24
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = sbCaminhoCertClick
      end
      object lbSenha: TLabel
        Left = 711
        Top = 61
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object Label33: TLabel
        Left = 711
        Top = 104
        Width = 199
        Height = 15
        Caption = 'IdToken/IdCSC (Somente para NFC-e)'
      end
      object Label34: TLabel
        Left = 711
        Top = 151
        Width = 179
        Height = 15
        Caption = 'Token/CSC (Somente para NFC-e)'
      end
      object cbFormaEmissao: TComboBox
        Left = 11
        Top = 27
        Width = 248
        Height = 23
        TabOrder = 0
      end
      object cbModeloDF: TComboBox
        Left = 11
        Top = 73
        Width = 248
        Height = 23
        TabOrder = 1
      end
      object cbVersaoDF: TComboBox
        Left = 11
        Top = 120
        Width = 248
        Height = 23
        TabOrder = 2
      end
      object cbSSLLib: TComboBox
        Left = 272
        Top = 27
        Width = 160
        Height = 23
        Style = csDropDownList
        TabOrder = 3
      end
      object cbCryptLib: TComboBox
        Left = 272
        Top = 73
        Width = 160
        Height = 23
        Style = csDropDownList
        TabOrder = 4
      end
      object cbHttpLib: TComboBox
        Left = 272
        Top = 120
        Width = 160
        Height = 23
        Style = csDropDownList
        TabOrder = 5
      end
      object cbXmlSignLib: TComboBox
        Left = 272
        Top = 167
        Width = 160
        Height = 23
        Style = csDropDownList
        TabOrder = 6
      end
      object cbSSLType: TComboBox
        Left = 448
        Top = 167
        Width = 160
        Height = 23
        Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
        Style = csDropDownList
        TabOrder = 7
      end
      object cbUF: TComboBox
        Left = 448
        Top = 27
        Width = 249
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 24
        ParentFont = False
        TabOrder = 8
        Text = 'SP'
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object rgTipoAmb: TRadioGroup
        Left = 448
        Top = 57
        Width = 249
        Height = 52
        Caption = 'Selecione o Ambiente de Destino'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Produ'#231#227'o'
          'Homologa'#231#227'o')
        TabOrder = 9
      end
      object btSalvarConfiguracoes: TButton
        Left = 11
        Top = 347
        Width = 248
        Height = 25
        Caption = 'Salvar Configura'#231#245'es'
        TabOrder = 10
        OnClick = btSalvarConfiguracoesClick
      end
      object edCaminho: TEdit
        Left = 711
        Top = 30
        Width = 225
        Height = 23
        TabOrder = 11
      end
      object edSenha: TEdit
        Left = 711
        Top = 77
        Width = 249
        Height = 23
        PasswordChar = '*'
        TabOrder = 12
      end
      object edtIdToken: TEdit
        Left = 711
        Top = 122
        Width = 248
        Height = 21
        TabOrder = 13
      end
      object edtToken: TEdit
        Left = 711
        Top = 167
        Width = 248
        Height = 21
        TabOrder = 14
      end
    end
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 640
    Top = 240
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 640
    Top = 296
  end
end

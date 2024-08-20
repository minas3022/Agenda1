object Form2: TForm2
  Left = 460
  Top = 245
  AutoScroll = False
  BorderIcons = []
  Caption = 'Escolha o Usu'#225'rio e a senha'
  ClientHeight = 284
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 72
    Top = 96
    Width = 79
    Height = 13
    Caption = 'Digite sua senha'
  end
  object Label1: TLabel
    Left = 72
    Top = 56
    Width = 84
    Height = 13
    Caption = 'Escolha o usu'#225'rio'
  end
  object RxDBLookupCombo1: TRxDBLookupCombo
    Left = 160
    Top = 48
    Width = 353
    Height = 25
    DropDownCount = 8
    DisplayAllFields = True
    ItemHeight = 20
    LookupField = 'NOME'
    LookupDisplay = 'NOME'
    LookupSource = DTSenha
    TabOrder = 0
    OnExit = RxDBLookupCombo1Exit
  end
  object Senha2: TEdit
    Left = 160
    Top = 96
    Width = 337
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Senha1: TDBEdit
    Left = 352
    Top = 128
    Width = 177
    Height = 21
    DataField = 'NSENHA'
    DataSource = DTSenha
    Enabled = False
    TabOrder = 2
    Visible = False
  end
  object COND: TDBEdit
    Left = 336
    Top = 168
    Width = 177
    Height = 21
    DataField = 'EDICAO'
    DataSource = DTSenha
    Enabled = False
    TabOrder = 3
    Visible = False
  end
  object Button1: TButton
    Left = 56
    Top = 200
    Width = 153
    Height = 57
    Hint = 'Confirmar'
    Caption = 'Confirmar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 200
    Width = 153
    Height = 57
    Hint = 'Finalizar Agenda'
    Caption = 'Cancelar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 400
    Top = 192
    Width = 137
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'Edit1'
    Visible = False
  end
  object Edicao1: TEdit
    Left = 480
    Top = 8
    Width = 25
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object Edicao2: TEdit
    Left = 504
    Top = 8
    Width = 25
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object Edicao4: TEdit
    Left = 504
    Top = 26
    Width = 25
    Height = 21
    TabOrder = 9
    Visible = False
  end
  object Edicao3: TEdit
    Left = 480
    Top = 26
    Width = 25
    Height = 21
    TabOrder = 10
    Visible = False
  end
  object ADOSenhaConect: TADOConnection
    ConnectionTimeout = 0
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDAIPP.DSO'
    Left = 216
    Top = 144
  end
  object DTSenha: TDataSource
    AutoEdit = False
    DataSet = ADOSenha
    Left = 168
    Top = 144
  end
  object ADOSenha: TADOQuery
    Connection = ADOSenhaConect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SENHA ORDER BY NOME')
    Left = 136
    Top = 144
    object ADOSenhaNSENHA: TStringField
      FieldName = 'NSENHA'
      Size = 100
    end
    object ADOSenhaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object ADOSenhaEDICAO: TIntegerField
      FieldName = 'EDICAO'
    end
  end
  object EnterAutomatico1: TEnterAutomatico
    EnterAutomatico = True
    Left = 24
    Top = 24
  end
  object Cript: TCriptografia
    Chave = 16854
    Left = 64
    Top = 136
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 552
    Top = 24
  end
end

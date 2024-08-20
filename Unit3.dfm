object Form3: TForm3
  Left = 169
  Top = 231
  Width = 562
  Height = 291
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Usuários'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF
    FFF77777777777777777777FFFFFFFFFFFF77777777777777777777FFFFFFFFF
    F0000000000000000000077FFFFFFFFFF0888888888888888888077FFFFFFFFF
    F0800000000000000008077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0808F8F0000008F8F08077FFFFFFFFF
    F080F8F8044440F8F808077FFFFFFFFFF0808F8F0FFFF08F8F08077FFFFFFFFF
    F080F8F8000000F8F808077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0800000000000000008077FFFFFFFFF
    F0888888888888888888077FFFFFFFFFF0800000000000000008077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F080F8F8000000F8F808077FFFFFFFFFF0808F8F0444408F8F08077FFFFFFFFF
    F080F8F80FFFF0F8F808077FFFFFFFFFF0808F8F0000008F8F08077FFFFFFFFF
    F080F8F8F8F8F8F8F808077FFFFFFFFFF0808F8F8F8F8F8F8F08077FFFFFFFFF
    F0800000000000000008077FFFFFFFFFF08888888888888888880FFFFFFFFFFF
    F00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 72
    Width = 39
    Height = 13
    Caption = 'Usuário:'
  end
  object Label2: TLabel
    Left = 139
    Top = 112
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label3: TLabel
    Left = 48
    Top = 16
    Width = 300
    Height = 13
    Caption = 'Tipo Edição: 1-Alterador 2-Usuário 3-Gerenciador 4-Adicionador'
  end
  object EditNOME: TDBEdit
    Left = 192
    Top = 72
    Width = 201
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME'
    DataSource = DTSCadastro
    TabOrder = 1
  end
  object EditSENHA: TDBEdit
    Left = 192
    Top = 112
    Width = 161
    Height = 21
    DataField = 'NSENHA'
    DataSource = DTSCadastro
    TabOrder = 2
  end
  object EditEDICAO: TDBEdit
    Left = 192
    Top = 32
    Width = 65
    Height = 21
    DataField = 'EDICAO'
    DataSource = DTSCadastro
    TabOrder = 0
  end
  object DBNavigator1: TDBNavigator
    Left = 136
    Top = 216
    Width = 230
    Height = 33
    DataSource = DTSCadastro
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 320
    Top = 144
    Width = 97
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object Edit2: TEdit
    Left = 320
    Top = 176
    Width = 177
    Height = 21
    TabStop = False
    BorderStyle = bsNone
    TabOrder = 5
  end
  object Button1: TButton
    Left = 176
    Top = 168
    Width = 129
    Height = 33
    Caption = 'Ver Senha'
    TabOrder = 6
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 104
    Width = 129
    Height = 33
    Caption = 'Criptografar Senha'
    TabOrder = 7
    TabStop = False
    OnClick = Button2Click
  end
  object ADOCadastro: TADOConnection
    ConnectionTimeout = 0
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDAIPP.DSO'
    Left = 40
    Top = 168
  end
  object DTSCadastro: TDataSource
    AutoEdit = False
    DataSet = ADOQryCadastro
    Left = 120
    Top = 176
  end
  object ADOQryCadastro: TADOQuery
    Connection = ADOCadastro
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM SENHA ORDER BY NOME')
    Left = 88
    Top = 176
    object ADOQryCadastroNSENHA: TStringField
      FieldName = 'NSENHA'
    end
    object ADOQryCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object ADOQryCadastroEDICAO: TIntegerField
      FieldName = 'EDICAO'
    end
  end
  object EnterAutomatico1: TEnterAutomatico
    EnterAutomatico = True
    Left = 72
    Top = 112
  end
  object Crip: TCriptografia
    Chave = 16854
    Left = 464
    Top = 48
  end
end

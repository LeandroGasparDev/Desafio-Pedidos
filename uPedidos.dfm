object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Emiss'#227'o de Pedidos'
  ClientHeight = 521
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pag: TPageControl
    Left = 0
    Top = 0
    Width = 860
    Height = 521
    ActivePage = tsPedLista
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsPedLista: TTabSheet
      Caption = 'Lista de Pedidos  '
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 852
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 64
      end
      object dbPedidos: TDBGrid
        Left = 0
        Top = 65
        Width = 852
        Height = 238
        Align = alTop
        DataSource = dsPedido
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUM_PEDIDO'
            Title.Caption = 'N'#186' Pedido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 269
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'R$ Valor'
            Width = 84
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 303
        Width = 852
        Height = 40
        Align = alTop
        TabOrder = 1
        object btnNovo: TBitBtn
          Left = 1
          Top = 1
          Width = 283
          Height = 38
          Align = alLeft
          Caption = 'Novo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnEditar: TBitBtn
          Left = 284
          Top = 1
          Width = 283
          Height = 38
          Align = alLeft
          Caption = 'Editar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object btnExcluir: TBitBtn
          Left = 567
          Top = 1
          Width = 283
          Height = 38
          Align = alLeft
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          PopupMenu = popExcluirTodosPedidos
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 352
        Width = 852
        Height = 138
        Align = alBottom
        Caption = '  Impress'#227'o de Venda '
        TabOrder = 2
        object GroupBox2: TGroupBox
          Left = 16
          Top = 24
          Width = 666
          Height = 105
          Caption = '  Condi'#231#227'o de Pagamento  '
          TabOrder = 0
          object rb01: TRadioButton
            Left = 16
            Top = 19
            Width = 161
            Height = 17
            Caption = 'A Vista sem Desconto'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rb02: TRadioButton
            Left = 16
            Top = 38
            Width = 169
            Height = 17
            Caption = 'A Vista com Desconto de 5%'
            TabOrder = 1
          end
          object rb03: TRadioButton
            Left = 16
            Top = 56
            Width = 177
            Height = 17
            Caption = 'A Vista com Desconto de 10%'
            TabOrder = 2
          end
          object rb04: TRadioButton
            Left = 16
            Top = 76
            Width = 217
            Height = 17
            Caption = 'A Vista com Desconto de (Informar %)'
            TabOrder = 3
          end
          object rb05: TRadioButton
            Left = 320
            Top = 19
            Width = 154
            Height = 17
            Caption = 'Acr'#233'scimo de 10%'
            TabOrder = 4
          end
          object rb06: TRadioButton
            Left = 320
            Top = 38
            Width = 154
            Height = 17
            Caption = 'Acr'#233'scimo de 12%'
            TabOrder = 5
          end
          object rb07: TRadioButton
            Left = 320
            Top = 56
            Width = 154
            Height = 17
            Caption = 'Acr'#233'scimo de (Informar %)'
            TabOrder = 6
          end
        end
        object GroupBox3: TGroupBox
          Left = 688
          Top = 24
          Width = 138
          Height = 57
          Caption = '  Condi'#231#227'o Personalizada  '
          TabOrder = 1
          object Label2: TLabel
            Left = 19
            Top = 27
            Width = 11
            Height = 13
            Caption = '%'
          end
          object edtPerc: TSpinEdit
            Left = 56
            Top = 24
            Width = 73
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
        end
        object btnSimularVenda: TBitBtn
          Left = 688
          Top = 87
          Width = 138
          Height = 42
          Caption = 'Simular Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnSimularVendaClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 19
        Width = 852
        Height = 46
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label12: TLabel
          Left = 4
          Top = 8
          Width = 116
          Height = 16
          Caption = 'Pesquisa de Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtPesqPedidos: TMaskEdit
          Left = 0
          Top = 25
          Width = 852
          Height = 21
          Align = alBottom
          CharCase = ecUpperCase
          TabOrder = 0
          Text = ''
          OnChange = edtPesqPedidosChange
        end
        object btnDadosExemplo: TBitBtn
          Left = 692
          Top = 3
          Width = 159
          Height = 21
          Caption = 'Carregar Dados de Exemplo'
          TabOrder = 1
          OnClick = btnDadosExemploClick
        end
      end
    end
    object tsPedido: TTabSheet
      Caption = 'Dados do Pedido'
      ImageIndex = 1
      object Label4: TLabel
        Left = 0
        Top = 0
        Width = 852
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 56
      end
      object Label11: TLabel
        Left = 0
        Top = 137
        Width = 852
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Itens do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 128
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 19
        Width = 852
        Height = 118
        Align = alTop
        TabOrder = 0
        object Label5: TLabel
          Left = 46
          Top = 23
          Width = 56
          Height = 16
          Caption = 'N'#186' Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 50
          Width = 94
          Height = 16
          Caption = 'Nome do Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 49
          Top = 76
          Width = 53
          Height = 16
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 489
          Top = 77
          Width = 39
          Height = 16
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 772
          Top = 77
          Width = 15
          Height = 16
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtNumPed: TDBEdit
          Left = 108
          Top = 21
          Width = 121
          Height = 21
          TabStop = False
          CharCase = ecUpperCase
          DataField = 'NUM_PEDIDO'
          DataSource = dsPedido
          ReadOnly = True
          TabOrder = 0
        end
        object edtCliente: TDBEdit
          Left = 108
          Top = 48
          Width = 646
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CLIENTE'
          DataSource = dsPedido
          TabOrder = 1
        end
        object edtEnd: TDBEdit
          Left = 108
          Top = 75
          Width = 365
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = dsPedido
          TabOrder = 2
        end
        object edtCidade: TDBEdit
          Left = 534
          Top = 75
          Width = 220
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = dsPedido
          TabOrder = 3
        end
        object edtUF: TDBEdit
          Left = 798
          Top = 76
          Width = 51
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = dsPedido
          TabOrder = 4
        end
        object btnBuscaCnpj: TBitBtn
          Left = 760
          Top = 45
          Width = 89
          Height = 25
          Caption = 'Buscar por CNPJ'
          TabOrder = 5
          OnClick = btnBuscaCnpjClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 448
        Width = 852
        Height = 42
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        DesignSize = (
          852
          42)
        object btnCancelarPed: TBitBtn
          Left = 562
          Top = 1
          Width = 145
          Height = 41
          Anchors = [akRight, akBottom]
          Caption = 'Cancelar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCancelarPedClick
        end
        object btnGravarPed: TBitBtn
          Left = 706
          Top = 1
          Width = 145
          Height = 41
          Anchors = [akRight, akBottom]
          Caption = 'Gravar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnGravarPedClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 352
        Width = 852
        Height = 64
        Align = alTop
        TabOrder = 2
        object Label3: TLabel
          Left = 1
          Top = 1
          Width = 850
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = 'Lan'#231'amento do Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 168
        end
        object Label10: TLabel
          Left = 14
          Top = 29
          Width = 44
          Height = 16
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 554
          Top = 29
          Width = 65
          Height = 16
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 686
          Top = 29
          Width = 49
          Height = 16
          Caption = 'R$ Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtProduto: TDBEdit
          Left = 64
          Top = 26
          Width = 484
          Height = 21
          CharCase = ecUpperCase
          DataField = 'PRODUTO'
          DataSource = dsPedItens
          TabOrder = 0
        end
        object edtQtde: TDBEdit
          Left = 627
          Top = 26
          Width = 53
          Height = 21
          CharCase = ecUpperCase
          DataField = 'QTDE'
          DataSource = dsPedItens
          TabOrder = 1
        end
        object edtValorUnit: TDBEdit
          Left = 741
          Top = 26
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALORUNIT'
          DataSource = dsPedItens
          TabOrder = 2
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 320
        Width = 852
        Height = 32
        Align = alTop
        TabOrder = 4
        DesignSize = (
          852
          32)
        object lblTotalPedido: TLabel
          Left = 717
          Top = 6
          Width = 118
          Height = 19
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'Valor Total R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 713
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 416
        Width = 852
        Height = 25
        DataSource = dsPedItens
        Align = alTop
        TabOrder = 5
        OnClick = DBNavigator1Click
      end
      object dbItens: TDBGrid
        Left = 0
        Top = 156
        Width = 852
        Height = 164
        Align = alTop
        DataSource = dsPedItens
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PRODUTO'
            Title.Caption = 'Produto'
            Width = 555
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Quantidade'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORUNIT'
            Title.Alignment = taRightJustify
            Title.Caption = 'R$ Unit'#225'rio'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORTOTAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'R$ Total'
            Width = 90
            Visible = True
          end>
      end
    end
    object tsMemo: TTabSheet
      Caption = 'Visualiza'#231#227'o do Pedido '
      DoubleBuffered = False
      ImageIndex = 2
      ParentDoubleBuffered = False
      object Panel5: TPanel
        Left = 0
        Top = 432
        Width = 852
        Height = 58
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          852
          58)
        object BitBtn1: TBitBtn
          Left = 707
          Top = 6
          Width = 145
          Height = 41
          Anchors = [akRight, akBottom]
          Caption = 'Voltar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCancelarPedClick
        end
      end
      object mmImp: TMemo
        Left = 0
        Top = 0
        Width = 852
        Height = 432
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object cdsPedido: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_PEDIDO'
    Params = <>
    BeforePost = cdsPedidoBeforePost
    AfterScroll = cdsPedidoAfterScroll
    Left = 96
    Top = 224
    object cdsPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 100
    end
    object cdsPedidoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsPedidoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsPedidoUF: TStringField
      FieldName = 'UF'
      Size = 100
    end
    object cdsPedidoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '0.00'
      currency = True
    end
  end
  object dsPedido: TDataSource
    DataSet = cdsPedido
    Left = 136
    Top = 224
  end
  object cdsPedItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'RECNO'
    Params = <>
    StoreDefs = True
    BeforePost = cdsPedItensBeforePost
    AfterPost = cdsPedItensAfterPost
    OnNewRecord = cdsPedItensNewRecord
    Left = 432
    Top = 208
    object cdsPedItensPRODUTO: TStringField
      DisplayWidth = 112
      FieldName = 'PRODUTO'
      Size = 100
    end
    object cdsPedItensQTDE: TIntegerField
      DisplayWidth = 12
      FieldName = 'QTDE'
    end
    object cdsPedItensVALORUNIT: TFloatField
      DisplayWidth = 14
      FieldName = 'VALORUNIT'
      DisplayFormat = '0.00'
      currency = True
    end
    object cdsPedItensVALORTOTAL: TFloatField
      DisplayWidth = 15
      FieldName = 'VALORTOTAL'
      DisplayFormat = '0.00'
      currency = True
    end
    object cdsPedItensNUM_PEDIDO: TIntegerField
      DisplayWidth = 13
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedItensRECNO: TIntegerField
      FieldName = 'RECNO'
    end
  end
  object dsPedItens: TDataSource
    DataSet = cdsPedItens
    Left = 472
    Top = 208
  end
  object popExcluirTodosPedidos: TPopupMenu
    Left = 736
    Top = 280
    object ExcluirTodosPedidos1: TMenuItem
      Caption = 'Excluir Todos Pedidos'
      OnClick = ExcluirTodosPedidos1Click
    end
  end
end

unit uPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, ShellAPI,
  Vcl.ComCtrls, Vcl.Samples.Spin, Xml.XMLDoc, Xml.xmldom, Xml.XMLIntf,


  SuperObject,
  ComObj, ActiveX, IdCoderMIME,
  AxCtrls, Vcl.Menus

  ;


type
  TfrmPedidos = class(TForm)
    pag: TPageControl;
    tsPedLista: TTabSheet;
    tsPedido: TTabSheet;
    Label1: TLabel;
    dbPedidos: TDBGrid;
    cdsPedido: TClientDataSet;
    cdsPedidoNUM_PEDIDO: TIntegerField;
    cdsPedidoCLIENTE: TStringField;
    cdsPedidoENDERECO: TStringField;
    cdsPedidoCIDADE: TStringField;
    cdsPedidoUF: TStringField;
    cdsPedidoVALOR: TFloatField;
    dsPedido: TDataSource;
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rb01: TRadioButton;
    rb02: TRadioButton;
    rb03: TRadioButton;
    rb04: TRadioButton;
    rb05: TRadioButton;
    rb06: TRadioButton;
    rb07: TRadioButton;
    GroupBox3: TGroupBox;
    edtPerc: TSpinEdit;
    Label2: TLabel;
    btnSimularVenda: TBitBtn;
    tsMemo: TTabSheet;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNumPed: TDBEdit;
    edtCliente: TDBEdit;
    edtEnd: TDBEdit;
    Panel2: TPanel;
    btnCancelarPed: TBitBtn;
    btnGravarPed: TBitBtn;
    Label8: TLabel;
    edtCidade: TDBEdit;
    Label9: TLabel;
    edtUF: TDBEdit;
    Panel3: TPanel;
    Label11: TLabel;
    Panel4: TPanel;
    lblTotalPedido: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtProduto: TDBEdit;
    edtQtde: TDBEdit;
    edtValorUnit: TDBEdit;
    DBNavigator1: TDBNavigator;
    cdsPedItens: TClientDataSet;
    cdsPedItensPRODUTO: TStringField;
    cdsPedItensQTDE: TIntegerField;
    cdsPedItensVALORUNIT: TFloatField;
    cdsPedItensVALORTOTAL: TFloatField;
    dsPedItens: TDataSource;
    dbItens: TDBGrid;
    cdsPedItensNUM_PEDIDO: TIntegerField;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    btnBuscaCnpj: TBitBtn;
    cdsPedItensRECNO: TIntegerField;
    mmImp: TMemo;
    Panel6: TPanel;
    edtPesqPedidos: TMaskEdit;
    Label12: TLabel;
    btnDadosExemplo: TBitBtn;
    popExcluirTodosPedidos: TPopupMenu;
    ExcluirTodosPedidos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarPedClick(Sender: TObject);
    procedure btnCancelarPedClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure cdsPedItensNewRecord(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure cdsPedItensBeforePost(DataSet: TDataSet);
    procedure cdsPedItensAfterPost(DataSet: TDataSet);
    procedure btnSimularVendaClick(Sender: TObject);
    procedure btnBuscaCnpjClick(Sender: TObject);
    procedure edtPesqPedidosChange(Sender: TObject);
    procedure cdsPedidoBeforePost(DataSet: TDataSet);
    procedure cdsPedidoAfterScroll(DataSet: TDataSet);
    procedure btnDadosExemploClick(Sender: TObject);
    procedure ExcluirTodosPedidos1Click(Sender: TObject);
  private
    { Private declarations }
    procedure RedimensionaGridItens; // Redimensiona a dbGrid de Itens em tempo de execução ...
    procedure saveXml(tipo: Integer); // Salva o XML (Pedidos ou Itens, conforme o tipo)
    procedure loadXml(tipo: Integer); // Carrega o XML (Pedidos ou Itens, conforme o tipo)
    function BuscaIDPedido(Metodo: Integer): Integer; // Gera o proximo numero do Pedido
    procedure CalculaTotalPedido; // Calcula/Atualiza o total do Pedido

    // Função pra fazer Requisição em Api's usando biblioteca do windows
    function HttpRequest(const aBody: string; const aMethod: String; aURL: String; aTimeout: integer; const aContentType: string = '') : TStringStream;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

{
  //*** Inicio ***\\
  Recursos pra ser usados apenas nessa unit ...
  se o projeto fosse maior, poderia ter uma unit funções
  com as declarações e implementações ..
}

procedure CopiarArquivos(const Origem, Destino: string);
var
  ArquivoOrigem, ArquivoDestino: string;
  Procura: TSearchRec;
begin
  // Inicia a busca por arquivos na pasta de origem
  if FindFirst(IncludeTrailingPathDelimiter(Origem) + '*.*', faAnyFile, Procura) = 0 then
  begin
    try
      repeat
        // Ignora entradas especiais '.' e '..'
        if (Procura.Name <> '.') and (Procura.Name <> '..') then
        begin
          ArquivoOrigem := IncludeTrailingPathDelimiter(Origem) + Procura.Name;
          ArquivoDestino := IncludeTrailingPathDelimiter(Destino) + Procura.Name;

          // Copia o arquivo para o destino
          CopyFile(PChar(ArquivoOrigem), PChar(ArquivoDestino), False);
        end;
      until FindNext(Procura) <> 0;
    finally
      FindClose(Procura);
    end;
  end;
end;

function ApenasNumeros(const Texto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['0'..'9'] then
      Result := Result + Texto[i];
  end;
end;
{//*** Fim ***\\}

procedure TfrmPedidos.btnBuscaCnpjClick(Sender: TObject);
var
  CNPJ, url     : String;
 _StringStream  : TStringStream;
 objRetorno     : ISuperObject;
begin
  CNPJ := ApenasNumeros(InputBox('Informe o CNPJ do Cliente','','00.060.824/0001-57'));
  if CNPJ = '' then
    Exit;

  url := 'https://www.receitaws.com.br/v1/cnpj/'+CNPJ;

  try
    _StringStream := HttpRequest(NullAsStringValue, 'GET', url, 100000, 'application/json');

    objRetorno    := SO(Utf8ToAnsi(_StringStream.DataString));

//    Exibe o json completo
//    showMessage(objRetorno.AsJSon(True));

    if objRetorno.S['status'] = 'ERROR' then
    begin
      ShowMessage('Não foi possível buscar as informações do CNPJ: '+CNPJ);
      Exit;
    end
    else
    begin
      cdsPedidoCLIENTE.AsString   := objRetorno.S['nome'];
      cdsPedidoENDERECO.AsString  := objRetorno.S['logradouro']+' ,'+objRetorno.S['numero']+' ,'+objRetorno.S['bairro'];
      cdsPedidoCIDADE.AsString    := objRetorno.S['municipio'];
      cdsPedidoUF.AsString        := objRetorno.S['uf'];

      dbItens.SetFocus;
    end;
  finally
    _StringStream.Free;
  end;
end;

procedure TfrmPedidos.btnCancelarPedClick(Sender: TObject);
begin
  cdsPedido.Cancel;
  cdsPedItens.Cancel;

  cdsPedItens.EmptyDataSet;
  loadXml(0);

  pag.ActivePage        := tsPedLista;
  tsPedLista.TabVisible := True;
  tsPedido.TabVisible   := False;
  tsMemo.TabVisible     := False;
end;

procedure TfrmPedidos.btnDadosExemploClick(Sender: TObject);
begin
  CopiarArquivos(ExtractFilePath(Application.ExeName)+'Dados\Exemplo',ExtractFilePath(Application.ExeName)+'Dados');
  loadXml(0);
end;

procedure TfrmPedidos.btnGravarPedClick(Sender: TObject);
begin
  cdsPedido.Post;
  saveXml(0);
  saveXml(1);

  cdsPedItens.EmptyDataSet;

  pag.ActivePage        := tsPedLista;
  tsPedLista.TabVisible := True;
  tsPedido.TabVisible   := False;
  tsMemo.TabVisible     := False;
end;

function TfrmPedidos.BuscaIDPedido(Metodo: Integer): Integer;
var
  NumPedido, MaxPedido: Integer;
  RowDataNode, RowNode: IXMLNode;
  XMLDocument : TXMLDocument;
begin
  try
    // Metodo 0 = Busca o ultimo registro do cds
    if Metodo = 0 then
    begin
      try
        cdsPedido.IndexFieldNames := 'NUM_PEDIDO';
        cdsPedido.Last;

        MaxPedido := cdsPedidoNUM_PEDIDO.AsInteger;
        Inc(MaxPedido);
      finally
        cdsPedido.IndexFieldNames := '';
      end;
    end
    else // Busca o ultimo registro dando load no XML ... fonte: openai
    begin
      XMLDocument := TXMLDocument.Create(ExtractFilePath(Application.ExeName) + '\Dados\Pedidos.xml');
      MaxPedido := 0;

      RowDataNode := XMLDocument.DocumentElement.ChildNodes.FindNode('ROWDATA');
      if Assigned(RowDataNode) then
      begin
        RowNode := RowDataNode.ChildNodes.First;
        while Assigned(RowNode) do
        begin
          if RowNode.NodeName = 'ROW' then
          begin
            NumPedido := StrToIntDef(RowNode.Attributes['NUM_PEDIDO'], 0);
            if NumPedido > MaxPedido then
              MaxPedido := NumPedido;
          end;
          RowNode := RowNode.NextSibling;
        end;
      end;
      Inc(MaxPedido);
    end;
  finally
    Result := MaxPedido;
  end;
end;

procedure TfrmPedidos.CalculaTotalPedido;
var
  vTotal: Double;
begin
  try
    vTotal := 0;
    if cdsPedItens.IsEmpty then
      Exit;
    cdsPedItens.Aggregates.Clear;
    with cdsPedItens.Aggregates.Add do
    begin
      AggregateName := 'TOTAL_PEDIDO';
      Expression    := 'SUM(VALORTOTAL)';
      Active        := True;
    end;
    try vTotal := cdsPedItens.Aggregates[0].Value except vTotal := 0 end;
  finally
    lblTotalPedido.Caption := 'Valor Total R$ '+FormatFloat('0.00',vTotal);

    cdsPedido.Edit;
    cdsPedidoVALOR.AsCurrency := vTotal;
    cdsPedido.Post;
    cdsPedido.Edit;
  end;
end;

procedure TfrmPedidos.cdsPedidoAfterScroll(DataSet: TDataSet);
begin
  btnDadosExemplo.Visible := cdsPedido.IsEmpty;
end;

procedure TfrmPedidos.cdsPedidoBeforePost(DataSet: TDataSet);
begin
  try
    cdsPedido.BeforePost := Nil;
    CalculaTotalPedido;
  finally
    cdsPedido.BeforePost := cdsPedidoBeforePost;
  end;
end;

procedure TfrmPedidos.cdsPedItensAfterPost(DataSet: TDataSet);
begin
  CalculaTotalPedido;
end;

procedure TfrmPedidos.cdsPedItensBeforePost(DataSet: TDataSet);
begin
  cdsPedItensVALORTOTAL.AsCurrency := cdsPedItensQTDE.AsInteger * cdsPedItensVALORUNIT.AsCurrency;
end;

procedure TfrmPedidos.cdsPedItensNewRecord(DataSet: TDataSet);
begin
  cdsPedItensNUM_PEDIDO.AsInteger := cdsPedidoNUM_PEDIDO.AsInteger;
  cdsPedItensRECNO.AsInteger      := cdsPedItensRECNO.AsInteger + 1;
end;

procedure TfrmPedidos.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button in ([nbInsert, nbEdit]) then
    edtProduto.SetFocus;
end;

procedure TfrmPedidos.edtPesqPedidosChange(Sender: TObject);
begin
  if edtPesqPedidos.GetTextLen > 0 then
  begin
    case edtPesqPedidos.Text[1] of
      '0'..'9' :
      begin
        cdsPedido.IndexFieldNames := dbPedidos.Columns[0].FieldName;
        cdsPedido.Locate(dbPedidos.Columns[0].FieldName, edtPesqPedidos.Text,[LoPartialKey,LoCaseInsensitive]);
      end
      else
      begin
        cdsPedido.IndexFieldNames := dbPedidos.Columns[1].FieldName;
        cdsPedido.Locate(dbPedidos.Columns[1].FieldName, edtPesqPedidos.Text, [loPartialKey,loCaseInsensitive]);
      end;
    end;
  end;
end;

procedure TfrmPedidos.ExcluirTodosPedidos1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir TODOS Pedidos ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    if InputBox('Digite o texto "EXCLUIR" para continuar','','') <> 'EXCLUIR' then
      Exit;

    try
      cdsPedido.First;
      while not cdsPedido.Eof do
      begin
        DeleteFile(ExtractFilePath(Application.ExeName) + 'Dados\Itens'+cdsPedidoNUM_PEDIDO.AsString+'.xml');

        cdsPedido.Delete;
      end;
    finally
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Dados\Pedidos.xml');
    end;
  end;
end;

procedure TfrmPedidos.btnNovoClick(Sender: TObject);
var
  MaxPedido: Integer;
begin
  MaxPedido := BuscaIDPedido(0);
  cdsPedido.Append;
  cdsPedidoNUM_PEDIDO.AsInteger := MaxPedido;

  if not cdsPedItens.Active then
    cdsPedItens.CreateDataSet;
  cdsPedItens.EmptyDataSet;

  pag.ActivePage        := tsPedido;
  tsPedLista.TabVisible := False;
  tsPedido.TabVisible   := True;
  tsMemo.TabVisible     := False;

  edtCliente.SetFocus;
end;

procedure TfrmPedidos.btnSimularVendaClick(Sender: TObject);
var
  Linha, CondPgto, vQtde, vUnit, vTotal : String;
  vPerc, vPedido : Double;
begin
  if cdsPedidoVALOR.AsCurrency = 0 then
  begin
    ShowMessage('Pedido com Valor Total R$0,00'+#13+'Não foi possível simular a Venda.' );
    Exit;
  end;

  if ((rb04.Checked) or (rb07.Checked)) and (edtPerc.Value = 0) then
  begin
    ShowMessage('Informe o % para Simular a Venda');
    edtPerc.SetFocus;
    Exit;
  end;

  vPerc := 0;
  if rb01.Checked then begin CondPgto := rb01.Caption; vPerc := 0 end;
  if rb02.Checked then begin CondPgto := rb02.Caption; vPerc := 5 end;
  if rb03.Checked then begin CondPgto := rb03.Caption; vPerc := 10 end;
  if rb04.Checked then begin CondPgto := 'A Vista com Desconto de '+edtPerc.Text+' %'; vPerc := edtPerc.Value  end;
  if rb05.Checked then begin CondPgto := rb05.Caption; vPerc := -10  end;
  if rb06.Checked then begin CondPgto := rb06.Caption; vPerc := -12  end;
  if rb07.Checked then begin CondPgto := 'Acréscimo de '+edtPerc.Text+' %'; vPerc := - edtPerc.Value  end;

  mmImp.Lines.Clear;
  mmImp.Lines.Add('...................................................................................................................................................');
  mmImp.Lines.Add('Venda: '+cdsPedidoNUM_PEDIDO.AsString);
  mmImp.Lines.Add('Cliente: '+cdsPedidoCLIENTE.AsString);
  mmImp.Lines.Add('Endereço: '+cdsPedidoENDERECO.AsString);
  mmImp.Lines.Add('Cidade/UF: '+cdsPedidoCIDADE.AsString + ' . '+cdsPedidoUF.AsString);

  mmImp.Lines.Add('...................................................................................................................................................');
  mmImp.Lines.Add('Produto                                                   Quantidade          R$ Unitário          R$ Total');
  mmImp.Lines.Add('...................................................................................................................................................');

    if not cdsPedItens.Active then
    cdsPedItens.CreateDataSet;
  cdsPedItens.EmptyDataSet;
  loadXml(1);

  cdsPedItens.First;
  while not cdsPedItens.Eof do
  begin
    cdsPedItens.Edit;
    cdsPedItensVALORUNIT.AsCurrency   := cdsPedItensVALORUNIT.AsCurrency * (1 - vPerc / 100);
    cdsPedItensVALORTOTAL.AsCurrency  := cdsPedItensQTDE.AsInteger  * cdsPedItensVALORUNIT.AsCurrency;
    cdsPedItens.Post;

    vQtde   := FormatFloat('0.00',cdsPedItensQTDE.AsInteger);
    vUnit   := FormatFloat('0.00',cdsPedItensVALORUNIT.AsFloat);
    vTotal  := FormatFloat('0.00',cdsPedItensVALORTOTAL.AsFloat);

    Linha := cdsPedItensPRODUTO.Text + StringOfChar(' ',58 - Length(cdsPedItensPRODUTO.Text));
    Linha := Linha + StringOfChar(' ', 10 - Length(vQtde)) + vQtde + StringOfChar(' ', 10);
    Linha := Linha + StringOfChar(' ', 11 - Length(vUnit)) + vUnit + StringOfChar(' ', 10);;
    Linha := Linha + StringOfChar(' ', 8 - Length(vTotal)) + vTotal;

    vPedido := vPedido + cdsPedItensVALORTOTAL.AsCurrency;

    mmImp.Lines.Add(Linha);
    cdsPedItens.Next;
  end;
  mmImp.Lines.Add('...................................................................................................................................................');

  mmImp.Lines.Add(StringOfChar(' ',90 ) + 'R$ Valor Total '+FormatFloat('0.00',vPedido));
  mmImp.Lines.Add('...................................................................................................................................................');
  mmImp.Lines.Add(CondPgto);
  mmImp.Lines.Add('...................................................................................................................................................');

  pag.ActivePage        := tsMemo;
  tsPedLista.TabVisible := False;
  tsPedido.TabVisible   := False;
  tsMemo.TabVisible     := True;

  cdsPedido.Cancel;
  cdsPedItens.Cancel;
end;

procedure TfrmPedidos.btnEditarClick(Sender: TObject);
begin
  cdsPedido.Edit;

  if not cdsPedItens.Active then
    cdsPedItens.CreateDataSet;
  cdsPedItens.EmptyDataSet;
  loadXml(1);

  pag.ActivePage        := tsPedido;
  tsPedLista.TabVisible := False;
  tsPedido.TabVisible   := True;
  tsMemo.TabVisible     := False;

  CalculaTotalPedido;
  edtCliente.SetFocus;
end;

procedure TfrmPedidos.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir o Pedido ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = ID_YES then
  begin
    cdsPedido.Delete;
    saveXml(0);
    if FileExists(ExtractFilePath(Application.ExeName) + 'Dados\Itens'+cdsPedidoNUM_PEDIDO.Asstring+'.xml') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Dados\Itens'+cdsPedidoNUM_PEDIDO.AsString+'.xml');
  end;
  dbPedidos.SetFocus;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  if (not FileExists(ExtractFilePath(Application.ExeName) + 'Dados\Pedidos.xml')) and (FileExists(ExtractFilePath(Application.ExeName) + 'Dados\Exemplo\Pedidos.xml'))  then
    ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'README.txt'), nil, nil, SW_SHOWNORMAL);

  loadXml(0);
  pag.ActivePage          := tsPedLista;
  tsPedLista.TabVisible   := True;
  tsPedido.TabVisible     := False;
  tsMemo.TabVisible       := False;

  RedimensionaGridItens;
end;

function TfrmPedidos.HttpRequest(const aBody, aMethod: String; aURL: String; aTimeout: integer; const aContentType: string): TStringStream;
var
  Request       : OleVariant;
  HttpStream    : IStream;
  OleStream     : TOleStream;
  _StringStream : TStringStream;
begin
  CoInitialize(nil);
  _StringStream := TStringStream.Create;
  try
    Request := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Request.Open(aMethod, aURL, False);
    Request.SetRequestHeader('Content-Type', aContentType);
    Request.Send(aBody);
    HttpStream := IUnknown(Request.ResponseStream) as IStream;

    OleStream := TOleStream.Create(HttpStream);
    _StringStream.LoadFromStream(OleStream);

    Result := _StringStream
  finally
    OleStream.Free;
    Request := Unassigned;
    CoUninitialize;
  end;
end;

procedure TfrmPedidos.loadXml(tipo: Integer);
begin
  case tipo of
    0:
    begin
      if not cdsPedido.Active then
        cdsPedido.CreateDataSet;
      cdsPedido.EmptyDataSet;

      if FileExists(ExtractFilePath(Application.ExeName) + 'Dados\Pedidos.xml') then
        cdsPedido.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Dados\Pedidos.xml');
    end;
    1:
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'Dados\Itens'+cdsPedidoNUM_PEDIDO.Asstring+'.xml') then
        cdsPedItens.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Dados\Itens'+cdsPedidoNUM_PEDIDO.AsString+'.xml');
    end;
  end;
end;

procedure TfrmPedidos.RedimensionaGridItens;
var
  I: Integer;
begin
  for I := 0 to dbItens.Columns.Count - 1 do
  begin
    if dbItens.Columns[I].FieldName = 'PRODUTO' then
      dbItens.Columns[I].Width := 555
    else
      dbItens.Columns[I].Width := 80;
  end;
end;

procedure TfrmPedidos.saveXml(tipo: Integer);
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName)+'Dados') then
    CreateDir(ExtractFilePath(Application.ExeName)+'Dados');

  case tipo of
    0: cdsPedido.SaveToFile(ExtractFilePath(Application.ExeName)+'Dados\Pedidos.xml',dfXML);
    1: cdsPedItens.SaveToFile(ExtractFilePath(Application.ExeName)+'Dados\Itens'+cdsPedidoNUM_PEDIDO.AsString+'.xml',dfXML);
  end;
end;


end.

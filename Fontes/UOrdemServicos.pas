unit UOrdemServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  JvExMask, JvToolEdit, JvMaskEdit, JvDBControls, Vcl.Grids, Vcl.DBGrids,
  IniFiles, ACBrBase, ACBrEnterTab, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, scControls, scGPControls,
  dxGDIPlusClasses;

type
  TFrmOrdemServicos = class(TForm)
    DtsObjeto: TDataSource;
    DtsServicos: TDataSource;
    DtsGridServico: TDataSource;
    DtsProduto: TDataSource;
    DtsGridProduto: TDataSource;
    DtsOrdem: TDataSource;
    DtsTotais: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    grpTotais: TGroupBox;
    lblServicos: TLabel;
    lblItens: TLabel;
    lblOS: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    lblQtdProdutos: TLabel;
    lblQtdServicos: TLabel;
    EdtTotalServicos: TDBEdit;
    EdtTotalProduto: TDBEdit;
    EdtTotalOS: TDBEdit;
    GroupBox1: TGroupBox;
    btnConfirmar: TBitBtn;
    btnDesconto: TBitBtn;
    btnFechar: TBitBtn;
    grpClient: TGroupBox;
    edtNome: TEdit;
    edtCpfCnpj: TEdit;
    edtCidade: TEdit;
    btnConsultaClientes: TBitBtn;
    edtCodigo: TEdit;
    btnEditar: TBitBtn;
    nbOrdem: TTabbedNotebook;
    Label4: TLabel;
    Label5: TLabel;
    grpObjeto: TGroupBox;
    lblPlaca1: TLabel;
    lblObj2: TLabel;
    lblObj3: TLabel;
    lblObj4: TLabel;
    lblObj5: TLabel;
    lblObj6: TLabel;
    lblObj7: TLabel;
    Edtobjeto1: TDBEdit;
    EdtObj2: TDBEdit;
    EdtObj3: TDBEdit;
    EdtObj4: TDBEdit;
    EdtObj5: TDBEdit;
    EdtObj6: TDBEdit;
    EdtObj7: TDBEdit;
    dbmDefeito: TDBMemo;
    dbmSolucao: TDBMemo;
    dbgrdServicos: TDBGrid;
    GroupBox2: TGroupBox;
    lblServico: TLabel;
    lblQuantidadeServico: TLabel;
    lblUnitarioServico: TLabel;
    lblValorTotal: TLabel;
    EdtCodServico: TEdit;
    edtNomeServico: TEdit;
    btnBuscaServicos: TBitBtn;
    EdtQuantidadeServico: TEdit;
    EdtVlrUnitServicos: TEdit;
    EdtVlrTotalServico: TEdit;
    GroupBox3: TGroupBox;
    btnAlterarServico: TBitBtn;
    btnExcluirServico: TBitBtn;
    dbgrdProdutos: TDBGrid;
    mmoObservacoes: TMemo;
    GroupBox4: TGroupBox;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    grpBuscaProdutos: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValoUnitario: TLabel;
    lblTotal: TLabel;
    EdtVlrProdutoTotal: TEdit;
    EdtVlrProdutoUnitario: TcxCurrencyEdit;
    edtQuantidadeProduto: TEdit;
    EdtCodigoProduto: TEdit;
    edtNomeProd: TEdit;
    btnBusca: TBitBtn;
    procedure edtCodigoExit(Sender: TObject);
    procedure btnConsultaClientesClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaServicosClick(Sender: TObject);
    procedure EdtVlrUnitServicosExit(Sender: TObject);
    procedure dbgrdServicosDblClick(Sender: TObject);
    procedure btnAlterarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgrdProdutosDblClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dbgrdServicosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodServicoExit(Sender: TObject);
    procedure EdtCodServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigoProdutoExit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtVlrProdutoUnitarioExit(Sender: TObject);
    procedure scGPGlyphButton9Click(Sender: TObject);
    procedure FormResize(Sender: TObject);


  private
    procedure AtualizarGrids(id_ordem: Integer);
    procedure DesabilitarCampos;
    procedure LimparCampos;
    procedure LimparCamposServico;
    procedure CustomDrawDBGridCell(DBGrid: TDBGrid; Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CalcularTotalQuantidades;
    procedure ClearInputFields;
    procedure InsertServico(idOrdemServico,idServico, quantidade: Integer; valorUnitario, valorTotal: Double);
    procedure AdjustColumnsByPercentage(DBGrid: TDBGrid;
      ColumnPercents: array of Double);
    procedure InsertProduto(idOrdemServico,idProduto, idVariacao, idUsuarioVendedor: Integer;
      quantidade, valorUnitario, valorTotal: Double; codigoBarras: String);
    { Private declarations }
  public
   var
     idOrdemServico,ehEdicaoOrdem,edicao,edicao_servico, edicao_produto, edicao_ordem : Integer;
     texto:string;

  end;

var
  FrmOrdemServicos: TFrmOrdemServicos;


implementation

uses
  UDmOrdemServicos, UFrmBuscaCliente, UProcedures, UFrmBuscaProduto, UFrmConfig, UFrmDetalhes, UFrmConsultaOrdens, UFrmMenu,
  UserData, view.BuscaServicos, UDmProdutos, UDmServicos, view.Principal;

{$R *.dfm}

procedure TFrmOrdemServicos.DesabilitarCampos;
begin
  edtCodigo.Enabled := False;
  edtNome.Enabled := False;
  edtCpfCnpj.Enabled := False;
  edtCidade.Enabled := False;
end;

procedure TFrmOrdemServicos.EdtCodigoProdutoExit(Sender: TObject);
begin
  if EdtCodigoProduto.Text <> EmptyStr then
      begin
        DmOrdemServicos.qryProdutos.Close;
        DmOrdemServicos.qryProdutos.ParamByName('codproduto').AsString:= EdtCodigoProduto.Text;
        DmOrdemServicos.qryProdutos.Open;
        if DmOrdemServicos.qryProdutos.RecordCount > 0 then
          begin
            EdtNomeProd.Text := DmOrdemServicos.qryProdutos.FieldByName('nome').AsString;
            EdtVlrProdutoUnitario.Text:= CurrToStr(DmOrdemServicos.qryProdutos.FieldByName('preco_venda').AsCurrency);
            edtQuantidadeProduto.Text := '1';
          end
        else
          begin
            Application.MessageBox('Código do Produto não localizado ou Inativo!','Aviso',mb_Ok+mb_IconExclamation);
            EdtNomeProd.Clear;
            edtQuantidadeProduto.Clear;
            EdtVlrProdutoUnitario.Clear;
            EdtVlrProdutoTotal.Clear;
            EdtCodigoProduto.Clear;
            EdtCodigoProduto.SetFocus;
          end;
      end;

end;

procedure TFrmOrdemServicos.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
    btnBuscaClick(self);
end;


procedure TFrmOrdemServicos.AtualizarGrids(id_ordem: Integer);
begin
  try
    // Grid Serviços
    DmOrdemServicos.qryServicos.Open;
    DmOrdemServicos.qryServicos.Append;
    DmOrdemServicos.qryGridServicos.Close;
    DmOrdemServicos.qryGridServicos.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
    DmOrdemServicos.qryGridServicos.Open;

    // Grid Produtos
    DmOrdemServicos.qryProdutos.Open;
    DmOrdemServicos.qryProdutos.Append;
    DmOrdemServicos.qryGridProdutos.Close;
    DmOrdemServicos.qryGridProdutos.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
    DmOrdemServicos.qryGridProdutos.Open;


    // Totais
    DmOrdemServicos.QTotal.Close;
    DmOrdemServicos.QTotal.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
    DmOrdemServicos.QTotal.Open;

    CalcularTotalQuantidades;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar os dados das grids: ' + E.Message);
    end;
  end;
end;

procedure TFrmOrdemServicos.LimparCampos;
begin
  edtNome.Text := '';
  edtCpfCnpj.Text := '';
  edtCidade.Text := '';
end;

procedure TFrmOrdemServicos.btnAlterarClick(Sender: TObject);
begin
  dbgrdProdutosDblClick(self);
end;

procedure TFrmOrdemServicos.btnAlterarServicoClick(Sender: TObject);
begin
  dbgrdServicosDblClick(self);
end;

procedure TFrmOrdemServicos.btnBuscaClick(Sender: TObject);
begin
  if FrmBuscaProduto = nil then
    begin
      FrmBuscaProduto  := TFrmBuscaProduto .Create(Application);
      FrmBuscaProduto .Visible := False;
      FrmBuscaProduto .ShowModal;
    end
  else
    begin
      FrmBuscaProduto .ShowModal;
    end;
end;

procedure TFrmOrdemServicos.btnBuscaServicosClick(Sender: TObject);
begin
  if FrmServicos = nil then
    begin
      FrmServicos := TFrmServicos.Create(Application);
      FrmServicos.Visible := False;
      FrmServicos.ShowModal;
    end
  else
    begin
      FrmServicos.ShowModal;
    end;
end;

procedure TFrmOrdemServicos.btnConfirmarClick(Sender: TObject);
begin
  if dbmDefeito.Text = '' then
     begin
        dbmDefeito.Alignment := taCenter;
        dbmDefeito.Text := '** Sem descrição de defeito Cadastrado **';
     end;
  if dbmSolucao.Text = '' then
        begin
          dbmSolucao.Alignment := taCenter;
          dbmSolucao.Text := '** Sem descrição de Solução Cadastrado **';
        end;
   begin
     DmOrdemServicos.QObjeto.FieldByName('id_ordem_servico').AsInteger := idOrdemServico;
     DmOrdemServicos.QObjeto.FieldByName('id_objeto').AsInteger := 1;
     DmOrdemServicos.QObjeto.FieldByName('id_usuario_cadastro_defeito').AsInteger := TUserSession.GetInstance.UserID;
     DmOrdemServicos.QObjeto.Post;
     atualizarOrdemServico(idOrdemServico);
     if FrmDetalhe = nil then
         begin
           FrmDetalhe := TFrmDetalhe.Create(Application);
           FrmDetalhe.Visible := False;
           FrmDetalhe.ShowModal;
         end
     else
       begin
         FrmDetalhe.ShowModal;
       end;
   end;
end;


procedure TFrmOrdemServicos.btnConsultaClick(Sender: TObject);
begin
  FrmOrdemServicos.close;
end;

procedure TFrmOrdemServicos.btnConsultaClientesClick(Sender: TObject);
begin
  if FrmBuscaCliente = nil then
    begin
      FrmBuscaCliente := TFrmBuscaCliente.Create(Application);
      FrmBuscaCliente.Visible := False;
      FrmBuscaCliente.ShowModal;
    end
  else
    begin
      FrmBuscaCliente.ShowModal;
    end;
end;

procedure TFrmOrdemServicos.btnEditarClick(Sender: TObject);
begin
  edtCodigo.Enabled := true;
  edtNome.Enabled := true;
  edtCpfCnpj.Enabled := true;
  edtCidade.Enabled := true;
  edtCodigo.SetFocus;
  edicao:= 1;

end;

procedure TFrmOrdemServicos.btnExcluirClick(Sender: TObject);
begin
  excluirProduto(DmOrdemServicos.qryGridProdutos.FieldByName('id_item_ordem_servico').AsInteger);
  DmOrdemServicos.qryGridProdutos.Refresh;
end;

procedure TFrmOrdemServicos.btnExcluirServicoClick(Sender: TObject);
begin
  ExcluirServico(DmOrdemServicos.qryGridServicos.FieldByName('id_servico_ordem_servico').AsInteger);
  DmOrdemServicos.qryGridServicos.Refresh;
end;

procedure TFrmOrdemServicos.btnFecharClick(Sender: TObject);
begin
  Close;
end;



procedure TFrmOrdemServicos.dbgrdProdutosDblClick(Sender: TObject);
begin
    EdtCodigoProduto.Text := IntToStr(DmOrdemServicos.qryGridProdutos.FieldByName('id_produto').AsInteger);
    edtNomeProd.Text := DmOrdemServicos.qryGridProdutos.FieldByName('Nome').AsString;
    edtQuantidadeProduto.Text := IntToStr(DmOrdemServicos.qryGridProdutos.FieldByName('quantidade').AsInteger);
    EdtVlrProdutoUnitario.Value := DmOrdemServicos.qryGridProdutos.FieldByName('valor_unitario').AsCurrency;
    EdtVlrProdutoTotal.text := currtostr(DmOrdemServicos.qryGridProdutos.FieldByName('valor_total').AsCurrency);
    EdtCodigoProduto.Enabled:= false;
    edtQuantidadeProduto.SetFocus;
    edicao_produto := 1;
    DmOrdemServicos.qryProdutos.Edit;
end;

procedure TFrmOrdemServicos.dbgrdProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  CustomDrawDBGridCell(dbgrdProdutos, Rect, DataCol, Column, State);
end;

procedure TFrmOrdemServicos.dbgrdServicosDblClick(Sender: TObject);
begin
  EdtCodServico.Text := DmServicos.QGridServico.FieldByName('id_servico').AsString;
  edtNomeServico.Text := dbgrdServicos.Fields[1].AsString;
  EdtQuantidadeServico.Text := IntToStr(DmServicos.QGridServico.FieldByName('quantidade').AsInteger);
  EdtVlrUnitServicos.text := currtostr(DmServicos.QGridServico.FieldByName('valor_unitario').AsCurrency);
  EdtVlrTotalServico.text := currtostr(DmServicos.QGridServico.FieldByName('valor_total').AsCurrency);
  EdtCodServico.Enabled:= false;
  EdtQuantidadeServico.SetFocus;
  edicao_servico := 1;
  DmServicos.QServicos.Edit;
end;

procedure TFrmOrdemServicos.dbgrdServicosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  CustomDrawDBGridCell(dbgrdServicos, Rect, DataCol, Column, State);
end;

procedure TFrmOrdemServicos.edtCodigoExit(Sender: TObject);
begin

  if edtCodigo.Text <> EmptyStr then
      begin
        DmOrdemServicos.QBuscaClientes.Close;
        DmOrdemServicos.QBuscaClientes.ParamByName('codigo').AsInteger := StrToInt(edtCodigo.Text);
        DmOrdemServicos.QBuscaClientes.Open;
        if DmOrdemServicos.QBuscaClientes.RecordCount > 0 then
          begin
            if DmOrdemServicos.QBuscaClientes.FieldByName('Situacao').AsString = 'ATIVO' then
              begin
                edtNome.Text := DmOrdemServicos.QBuscaClientes.FieldByName('nome').AsString;
                edtCpfCnpj.Text := DmOrdemServicos.QBuscaClientes.FieldByName('CPFCNPJ').AsString;
                edtCidade.Text := DmOrdemServicos.QBuscaClientes.FieldByName('Cidade').AsString;
              end
            else
              begin
                Application.MessageBox('CLIENTE INATIVO!','Aviso',mb_Ok+mb_IconExclamation);
                edtCodigo.Clear;
              end;

          end
        else
          begin
            Application.MessageBox('Cliente não localizado!','Aviso',mb_Ok+mb_IconExclamation);
            edtNome.Text := '';
            edtCpfCnpj.Text:= '';
            edtCidade.Text:= '';
            edtCodigo.Clear;
            edtCodigo.SetFocus;
          end;
      end;

end;

procedure TFrmOrdemServicos.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F4 then
     btnConsultaClientesClick(self);
end;

procedure TFrmOrdemServicos.EdtCodigoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F4 then
    btnBuscaClick(self);
end;

procedure TFrmOrdemServicos.LimparCamposServico;
begin
  edtNomeServico.Clear;
  EdtQuantidadeServico.Clear;
  EdtVlrUnitServicos.Clear;
  EdtVlrTotalServico.Clear;
  EdtCodServico.Clear;
end;


procedure TFrmOrdemServicos.scGPGlyphButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrdemServicos.edtNomeExit(Sender: TObject);
var
  operacaoBemSucedida: Boolean;
  idCliente: Integer;
begin
  try
    if edicao = 1 then
    begin
      if MessageDlg('Deseja alterar o cliente da OS?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        idCliente := StrToInt(edtCodigo.Text);
        operacaoBemSucedida := editarClienteOrdem(idOrdemServico,idCliente);
        if operacaoBemSucedida then
          DesabilitarCampos; // Chamando um procedimento para desabilitar os campos
      end;
    end
    else
      begin
        if (edtCodigo.Text <> '') and (edtNome.Text <> '') then
          begin
            if MessageDlg('Deseja gerar uma nova OS?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                // Verificando se o código pode ser convertido para inteiro
                if TryStrToInt(edtCodigo.Text,idCliente) then
                  begin
                    operacaoBemSucedida := abrirordem(idCliente);
                    if operacaoBemSucedida then
                      begin
                        DesabilitarCampos;
                        AtualizarGrids(idOrdemServico); // Chamando um procedimento para atualizar as grids
                        Edtobjeto1.SetFocus;
                      end;
                  end
                else
                  begin
                    ShowMessage('Código inválido. Por favor, insira um número válido.');
                    edtCodigo.SetFocus;
                  end;
              end
            else
              begin
                LimparCampos;
                edtCodigo.SetFocus;
              end;
          end;
      end;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro: ' + E.Message);
    end;
  end;
end;

procedure TFrmOrdemServicos.EdtCodServicoExit(Sender: TObject);
var
  codServico: Integer;
begin
  if Trim(EdtCodServico.Text) <> '' then
    begin
      try
        codServico := StrToInt(EdtCodServico.Text);

        DmOrdemServicos.qryServicos.Close;
        DmOrdemServicos.qryServicos.ParamByName('codServico').AsInteger := codServico;
        DmOrdemServicos.qryServicos.Open;

        if DmOrdemServicos.qryServicos.RecordCount > 0 then
          begin
            edtNomeServico.Text := DmOrdemServicos.qryServicos.FieldByName('nome').AsString;
            EdtVlrUnitServicos.Text := CurrToStr(DmOrdemServicos.qryServicos.FieldByName('preco').AsCurrency);
            EdtQuantidadeServico.Text := '1'; // Atribui quantidade padrão
            EdtQuantidadeServico.SetFocus;
          end
        else
          begin
            Application.MessageBox('Código do Serviço não Localizado!', 'Aviso', MB_OK + MB_ICONEXCLAMATION);
            LimparCamposServico; // Chama um procedimento para limpar os campos
            EdtCodServico.SetFocus; // Foca no campo de código
          end;
      except
        on E: Exception do
        begin
          Application.MessageBox(PChar('Erro ao buscar serviço: ' + E.Message), 'Erro', MB_OK + MB_ICONERROR);
          LimparCamposServico;
          EdtCodServico.SetFocus;
        end;
      end;
    end;
end;

procedure TFrmOrdemServicos.EdtCodServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then
    btnBuscaServicosClick(self);
end;

procedure TFrmOrdemServicos.EdtVlrUnitServicosExit(Sender: TObject);
var
  quantidade,idServico: Integer;
  valorUnitario, valorTotal: Double;
begin
 // Verifica se os campos obrigatórios estão preenchidos
  if (EdtCodServico.Text = '') or (EdtQuantidadeServico.Text = '') then
    begin
      Application.MessageBox('Favor Preencher o Serviço Corretamente!', 'Atenção', mb_OK + mb_IconExclamation);
      EdtCodServico.SetFocus;
      Exit;  // Encerrar a execução da função se os campos não estão preenchidos
    end;
  // Tenta converter a quantidade e o valor unitário
  try
    quantidade := StrToInt(EdtQuantidadeServico.Text);
    valorUnitario := StrToFloat(EdtVlrUnitServicos.Text);
    valorTotal := quantidade * valorUnitario;
    idServico := StrToInt(EdtCodServico.Text);
  except
    on E: Exception do
    begin
      Application.MessageBox('Valor inválido. Por favor, verifique os campos de valor!', 'Atenção', mb_OK + mb_IconExclamation);
      EdtCodServico.SetFocus;
      Exit;  // Encerrar a execução se a conversão falhar
    end;
  end;

  EdtVlrTotalServico.Text := FloatToStr(valorTotal);  // Atualiza o valor total do serviço

  // Verifica se a ordem de serviço é válida
  if idOrdemServico > 0 then
    begin
      if edicao_servico = 1 then
      begin
        editarServico(DmServicos.QGridServico.FieldByName('id_servico_ordem_servico').AsInteger);
      end
      else
        begin
        InsertServico(idOrdemServico,idServico, quantidade, valorUnitario, valorTotal);
        // Limpa os campos de entrada
        ClearInputFields;
        CalcularTotalQuantidades;
        AtualizarGrids(idOrdemServico);

        EdtCodServico.SetFocus;
      end;
    end
  else
    begin
      Application.MessageBox('A ordem de serviço não foi gerada, informe um cliente válido para geração!', 'Atenção', mb_OK + mb_IconExclamation);
    end;
end;


procedure TFrmOrdemServicos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //mConsultaOrdens.ehEdicaoOrdem := 0;
    //FrmMenu.id_ordem := 0;//Verificar se a

    //Atualizar os grid e Totais do Consulta Ordem
    //mConsultaOrdens.qryConsultaOrdem.Refresh;
    //mConsultaOrdens.qryTotais.Refresh;

    Action := caFree;
    FrmOrdemServicos := nil;

end;

procedure TFrmOrdemServicos.FormCreate(Sender: TObject);
begin
  DmOrdemServicos := TDmOrdemServicos.Create(self);
  nbOrdem.PageIndex := 0;

  with DmOrdemServicos do
     begin
        if view_principal.ehEdicaoOrdem = 1 then
            begin
              // Define o ID da ordem de serviço para utilizar em váriavel local
              idOrdemServico:= FrmConsultaOrdens.dbgrdOrdens.Columns[0].Field.AsInteger;

              //entidade
              QBuscaClientes.Close;
              QBuscaClientes.ParamByName('codigo').AsInteger := FrmConsultaOrdens.idCliente;
              QBuscaClientes.Open;

              edtCodigo.Text := IntToStr(FrmConsultaOrdens.idCliente);
              edtNome.Text := DmOrdemServicos.QBuscaClientes.FieldByName('nome').AsString;
              edtCpfCnpj.Text := DmOrdemServicos.QBuscaClientes.FieldByName('CPFCNPJ').AsString;
              edtCidade.Text := DmOrdemServicos.QBuscaClientes.FieldByName('cidade').AsString;

              //Bloquear campos do Cliente
              DesabilitarCampos;

              //Ordem de Serviços
              QOrdem.Close;
              QOrdem.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
              QOrdem.Open;
              mmoObservacoes.Text := DmOrdemServicos.QOrdem.FieldByName('observacao').AsString;

              //Objeto
              DmOrdemServicos.QObjeto.Close;
              DmOrdemServicos.QObjeto.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
              DmOrdemServicos.QObjeto.Open;
              DmOrdemServicos.QObjeto.Edit;
            end
        else
            begin
              QObjeto.ParamByName('idOrdemServico').AsInteger := idOrdemServico;
              QObjeto.Open;
              QObjeto.Append;
            end;

        AtualizarGrids(idOrdemServico);
     end;
end;

procedure TFrmOrdemServicos.FormDestroy(Sender: TObject);
begin
  if Assigned(DmOrdemServicos) then
    begin
      DmOrdemServicos.QObjeto.Close;
      DmOrdemServicos.QTotal.Close;

      DmOrdemServicos.qryServicos.Close;
      DmOrdemServicos.qryGridServicos.Close;

      DmOrdemServicos.qryProdutos.Close;
      DmOrdemServicos.qryGridProdutos.Close;

      FreeAndNil(DmOrdemServicos);
    end;
end;


procedure TFrmOrdemServicos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3:
      btnConfirmarClick(Self); // Confirmação com F3
    VK_ESCAPE:
      btnFecharClick(Self); // Fechar com ESC
  end;
end;

procedure TFrmOrdemServicos.FormResize(Sender: TObject);
begin

  AdjustColumnsByPercentage(dbgrdServicos, [0.07, 0.44, 0.07, 0.07, 0.15, 0.15]);
  AdjustColumnsByPercentage(dbgrdProdutos, [0.0886, 0.3658, 0.0961, 0.1161, 0.0949, 0.1111, 0.1273]);
end;

procedure TFrmOrdemServicos.CustomDrawDBGridCell(DBGrid: TDBGrid;
  Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin  // Define a cor de fundo e do texto com base no número da linha
  if odd(DBGrid.DataSource.DataSet.RecNo) then
  begin
    DBGrid.Canvas.Font.Color := clBlack;
    DBGrid.Canvas.Brush.Color := TColor($FAF3F3); // Cor para linhas ímpares
  end
  else
  begin
    DBGrid.Canvas.Font.Color := clBlack;
    DBGrid.Canvas.Brush.Color := clWhite; // Cor para linhas pares
  end;

  // Altera as cores se a célula estiver selecionada
  if (gdSelected in State) then
  begin
    DBGrid.Canvas.Font.Color := TColor($C54045);
    DBGrid.Canvas.Brush.Color := clWebLightSkyBlue; // Cor para linha selecionada
  end;

  // Preenche o retângulo com a cor definida
  DBGrid.Canvas.FillRect(Rect);

  // Desenha a célula padrão
  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrmOrdemServicos.EdtVlrProdutoUnitarioExit(Sender: TObject);
var
  idProduto, idVariacao, idUsuarioVendedor: Integer;
  valorUnitario, valorTotal, quantidade: Double;
  codigoBarras : String;
begin
 // Verifica se os campos obrigatórios estão preenchidos
  if (EdtCodigoProduto.Text = '') or (edtQuantidadeProduto.Text = '') then
    begin
      Application.MessageBox('Favor Preencher o Serviço Corretamente!', 'Atenção', mb_OK + mb_IconExclamation);
      EdtCodigoProduto.SetFocus;
      Exit;  // Encerrar a execução da função se os campos não estão preenchidos
    end;
    // Tenta converter a quantidade e o valor unitário
    try
      FormatSettings.DecimalSeparator := '.';
      quantidade := StrToFloat(edtQuantidadeProduto.text, FormatSettings);
      valorUnitario := EdtVlrProdutoUnitario.Value;
      valorTotal := quantidade * valorUnitario;
      idProduto := StrToInt(EdtCodigoProduto.Text);
      idVariacao:= DmOrdemServicos.qryProdutos.FieldByName('id_variacao').AsInteger;
      idUsuarioVendedor := TUserSession.GetInstance.UserID;
      codigoBarras := DmOrdemServicos.qryProdutos.FieldByName('codigo_barras').AsString;


    except
      on E: Exception do
      begin
        Application.MessageBox('Valor inválido. Por favor, verifique os campos de valor!', 'Atenção', mb_OK + mb_IconExclamation);
        EdtCodServico.SetFocus;
        Exit;  // Encerrar a execução se a conversão falhar
      end;
    end;

    EdtVlrProdutoTotal.Text := FloatToStr(valorTotal);  // Atualiza o valor total do serviço

    if idOrdemServico > 0 then
       begin
          if edicao_produto = 1 then
            begin
              editarProduto(DmOrdemServicos.qryGridProdutos.FieldByName('id_item_ordem_servico').AsInteger);
            end
          else
            begin
              InsertProduto(idOrdemServico,idProduto,idVariacao,idUsuarioVendedor, quantidade, valorUnitario, valorTotal, codigoBarras);
              // Limpa os campos de entrada
              ClearInputFields;
              CalcularTotalQuantidades;
              AtualizarGrids(idOrdemServico);

              EdtCodigoProduto.SetFocus;
            end;
        end
    else
      begin
        Application.MessageBox('A ordem de serviço não foi gerada, informe um cliente válido para geração!', 'Atenção', mb_OK + mb_IconExclamation);
      end;
end;


procedure TFrmOrdemServicos.CalcularTotalQuantidades;
var
  TotalProdutos: Integer;
  TotalServicos: Integer;
begin
  TotalProdutos := 0; // Inicializa a soma de produtos
  TotalServicos := 0; // Inicializa a soma de serviços

  // Somando as quantidades dos produtos
  if DmOrdemServicos.qryGridProdutos.Active and not DmOrdemServicos.qryGridProdutos.IsEmpty then
  begin
    DmOrdemServicos.qryGridProdutos.First; // Volta para o primeiro registro
    while not DmOrdemServicos.qryGridProdutos.Eof do
    begin
      if not DmOrdemServicos.qryGridProdutos.FieldByName('quantidade').IsNull then
        TotalProdutos := TotalProdutos + DmOrdemServicos.qryGridProdutos.FieldByName('quantidade').AsInteger;

      DmOrdemServicos.qryGridProdutos.Next; // Move para o próximo registro
    end;
  end;

  // Somando as quantidades dos serviços
  if DmOrdemServicos.qryGridServicos.Active and not DmOrdemServicos.qryGridServicos.IsEmpty then
  begin
    DmOrdemServicos.qryGridServicos.First; // Volta para o primeiro registro
    while not DmOrdemServicos.qryGridServicos.Eof do
    begin
      if not DmOrdemServicos.qryGridServicos.FieldByName('quantidade').IsNull then
        TotalServicos := TotalServicos + DmOrdemServicos.qryGridServicos.FieldByName('quantidade').AsInteger;

      DmOrdemServicos.qryGridServicos.Next; // Move para o próximo registro
    end;
  end;

  // Atualiza os rótulos com os totais, exibindo 0 se não houver quantidade
  lblQtdProdutos.Caption := IntToStr(TotalProdutos); // Exibe a quantidade total de produtos
  lblQtdServicos.Caption := IntToStr(TotalServicos); // Exibe a quantidade total de serviços
end;

procedure TFrmOrdemServicos.ClearInputFields;
begin
  EdtCodServico.Clear;
  edtNomeServico.Clear;
  EdtQuantidadeServico.Clear;
  EdtVlrUnitServicos.Text := FormatFloat('#,##0.00', 0);
  EdtVlrTotalServico.Text := FormatFloat('#,##0.00', 0);

  edtNomeProd.Text := '';
  EdtCodigoProduto.Clear;
  edtQuantidadeProduto.Clear;
  EdtVlrProdutoUnitario.Text := FormatFloat('#,##0.00', 0);
  EdtVlrProdutoTotal.Text := FormatFloat('#,##0.00', 0);
end;


procedure TFrmOrdemServicos.InsertServico(idOrdemServico,idServico, quantidade: Integer; valorUnitario, valorTotal: Double);
var
  sqlInsert: string;
begin
  sqlInsert := 'INSERT INTO servico_ordem_servico (id_ordem_servico,id_servico, valor_desconto_total, valor_acrescimo_total, ' +
               'id_usuario_tecnico, quantidade, hash_md5, valor_unitario, valor_total) ' +
               'VALUES (:id_ordem_servico,:id_servico, :valor_desconto_total, :valor_acrescimo_total, ' +
               ':id_usuario_tecnico, :quantidade, :hash_md5, :valor_unitario, :valor_total)';

  DmOrdemServicos.qryGeneric.SQL.Text := sqlInsert;

  // Atribuindo valores aos parâmetros
  DmOrdemServicos.qryGeneric.ParamByName('id_ordem_servico').AsInteger := idOrdemServico;
  DmOrdemServicos.qryGeneric.ParamByName('id_servico').AsInteger := idServico;
  DmOrdemServicos.qryGeneric.ParamByName('valor_desconto_total').AsFloat := 0.00;
  DmOrdemServicos.qryGeneric.ParamByName('valor_acrescimo_total').AsFloat := 0.00;
  DmOrdemServicos.qryGeneric.ParamByName('id_usuario_tecnico').AsInteger := 1;
  DmOrdemServicos.qryGeneric.ParamByName('quantidade').AsInteger := quantidade;
  DmOrdemServicos.qryGeneric.ParamByName('hash_md5').AsString := 'teste'; // Substituir por sua função de hash MD5
  DmOrdemServicos.qryGeneric.ParamByName('valor_unitario').AsFloat := valorUnitario;
  DmOrdemServicos.qryGeneric.ParamByName('valor_total').AsFloat := valorTotal;

  // Executar o comando SQL
  try
    DmOrdemServicos.qryGeneric.ExecSQL; // Executa o comando INSERT
  except
    on E: Exception do
      Application.MessageBox(PChar('Erro ao inserir serviço: ' + E.Message), 'Atenção', mb_OK + mb_IconExclamation);
  end;
end;

procedure TFrmOrdemServicos.AdjustColumnsByPercentage(DBGrid: TDBGrid; ColumnPercents: array of Double);
var
  TotalWidth, i: Integer;
begin
  TotalWidth := DBGrid.Width;

  // Verifica se o número de porcentagens coincide com o número de colunas
  if Length(ColumnPercents) <> DBGrid.Columns.Count then
    raise Exception.Create('O número de porcentagens não corresponde ao número de colunas.');

  // Ajusta a largura de cada coluna baseado na porcentagem definida
  for i := 0 to DBGrid.Columns.Count - 1 do
  begin
    DBGrid.Columns[i].Width := Round(TotalWidth * ColumnPercents[i]);
  end;
end;

procedure TFrmOrdemServicos.InsertProduto(idOrdemServico,idProduto, idVariacao, idUsuarioVendedor : Integer;
                                            quantidade, valorUnitario, valorTotal: Double; codigoBarras: String);
var
  sqlInsert: string;
begin
    sqlInsert := 'INSERT INTO item_ordem_servico ' +
                 '(id_ordem_servico, id_produto, id_variacao, codigo_barras, quantidade, ' +
                 'valor_unitario, valor_total, valor_desconto_total, valor_acrescimo_total, ' +
                 'hash_md5, numero_serie, id_usuario_vendedor) ' +
                 'VALUES ' +
                 '(:id_ordem_servico, :id_produto, :id_variacao, :codigo_barras, :quantidade, ' +
                 ':valor_unitario, :valor_total, :valor_desconto_total, :valor_acrescimo_total, ' +
                 ':hash_md5, :numero_serie, :id_usuario_vendedor)';

  with DmOrdemServicos.qryGeneric do
    begin
      SQL.Text := sqlInsert;
      ParamByName('id_ordem_servico').AsInteger := idOrdemServico;
      ParamByName('id_produto').AsInteger := idProduto;
      ParamByName('id_variacao').AsInteger := idVariacao;
      ParamByName('codigo_barras').AsString := codigoBarras;
      ParamByName('quantidade').AsFloat := quantidade;
      ParamByName('valor_unitario').AsFloat := valorUnitario;
      ParamByName('valor_total').AsFloat := valorTotal;
      ParamByName('valor_desconto_total').AsFloat := 0.00;
      ParamByName('valor_acrescimo_total').AsFloat := 0.00;
      ParamByName('hash_md5').AsString := 'Codixy';
      ParamByName('numero_serie').AsString := '';
      ParamByName('id_usuario_vendedor').AsInteger := idUsuarioVendedor;
     end;

  // Executar o comando SQL
  try
    DmOrdemServicos.qryGeneric.ExecSQL; // Executa o comando INSERT
  except
    on E: Exception do
      Application.MessageBox(PChar('Erro ao inserir serviço: ' + E.Message), 'Atenção', mb_OK + mb_IconExclamation);
  end;
end;


end.

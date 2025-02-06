unit UFrmConsultaOrdens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.ComCtrls,QRPDFFilt,COMOBJ,System.UITypes, Vcl.DBCtrls,DateUtils,
  ShellAPI, Vcl.ExtCtrls, scControls, scGPControls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsultaOrdens = class(TForm)
    DtsConsultaOrdens: TDataSource;
    DtsTotal: TDataSource;
    pdf: TQRPDFFilter;
    qryConsultaOrdem: TFDQuery;
    qryTotais: TFDQuery;
    qryConsultaOrdemid_ordem_servico: TIntegerField;
    qryConsultaOrdemid_cliente: TIntegerField;
    qryConsultaOrdemnome: TStringField;
    qryConsultaOrdemVProduto: TFMTBCDField;
    qryConsultaOrdemVServico: TFMTBCDField;
    qryConsultaOrdemVTotal: TFMTBCDField;
    qryConsultaOrdemSituacao: TStringField;
    qryConsultaOrdemdata_hora_cadastro: TSQLTimeStampField;
    qryConsultaOrdemdata_hora_faturamento: TSQLTimeStampField;
    qryConsultaOrdemid_filial: TIntegerField;
    qryConsultaOrdemnome_filial: TStringField;
    qryConsultaOrdemObjeto1: TStringField;
    qryConsultaOrdemObjeto2: TStringField;
    qryConsultaOrdemObjeto3: TStringField;
    qryConsultaOrdemObjeto4: TStringField;
    qryConsultaOrdemObjeto5: TStringField;
    qryConsultaOrdemObjeto6: TStringField;
    qryConsultaOrdemObjeto7: TStringField;
    qryConsultaOrdemidentificacao: TStringField;
    qryConsultaOrdemobjeto_adicional1: TStringField;
    qryConsultaOrdemobjeto_adicional2: TStringField;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnEstornar: TBitBtn;
    BtnExportar: TBitBtn;
    BtnFechar: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnNovaOS: TBitBtn;
    dbgrdOrdens: TDBGrid;
    grpBusca: TGroupBox;
    EdtPesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    grpPesquisaAvancada: TGroupBox;
    lblObjeto: TLabel;
    lblPeriodo: TLabel;
    lblSituacao: TLabel;
    lblate: TLabel;
    lblFilial: TLabel;
    EdtObjeto: TEdit;
    cbSituacao: TComboBox;
    cbFilial: TComboBox;
    edtDataInicial: TDateTimePicker;
    edtDataFinal: TDateTimePicker;
    grptotais: TGroupBox;
    lblQuantidadeOrdens: TLabel;
    lblValorTotal: TLabel;
    EdtQuantidadeOrdem: TDBEdit;
    EdtTotal: TDBEdit;
    scGPPanel3: TscGPPanel;
    scGPGlyphButton9: TscGPGlyphButton;
    scGPGlyphButton10: TscGPGlyphButton;
    scLabel7: TscLabel;
    scGPGlyphButton12: TscGPGlyphButton;
    scGPGlyphButton14: TscGPGlyphButton;
    procedure dbgrdOrdensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnNovaOSClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure BtnExportarClick(Sender: TObject);
    procedure EdtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnEstornarClick(Sender: TObject);
    procedure InicializarDatas;
    procedure CarregarOrdensPendente;
    procedure CarregarTotaisPendente;
    procedure VerificarPermissoesUsuario;
    procedure InicializarFormulario;
    procedure scGPGlyphButton9Click(Sender: TObject);
    procedure PrepareOrdensQuery(const ATexto: string);
    procedure PreparePendingQuery;
    procedure PrepareObjetoQuery(const AObjeto: string);
    procedure PrepareDataQuery(const ADataFinal: TDate);
    procedure scGPGlyphButton10Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);


  private

  public
    var
    idOrdemServico, ehEdicaoOrdem, idCliente:Integer;


  end;

var
  FrmConsultaOrdens: TFrmConsultaOrdens;

implementation

uses
  UProcedures, UOrdemServicos, UFrmMenu, URelOrdemSeta, UFrmRelTCM, UFrmExportar,
  UserData, UDmPrincipal, view.login, view.Principal;

{$R *.dfm}
procedure TFrmConsultaOrdens.InicializarDatas;
begin
  EdtDataInicial.Date := IncMonth(Date, -1);  // Define a data inicial para um mês anterior
  EdtDataFinal.Date := Date;                  // Define a data final para a data atual
end;

procedure TFrmConsultaOrdens.CarregarOrdensPendente;
begin
  qryConsultaOrdem.Close;
  qryConsultaOrdem.SQL.Add('WHERE situacao = ''Pendente'' AND id_filial = :idfilial');
  qryConsultaOrdem.ParamByName('idfilial').AsInteger := TUserSession.GetInstance.FilialTrabalhoID;
  qryConsultaOrdem.Open;
end;

procedure TFrmConsultaOrdens.CarregarTotaisPendente;
begin
  qryTotais.close;
  qryTotais.SQL.Add('WHERE situacao = ''Pendente'' AND id_filial = :idfilial');
  qryTotais.ParamByName('idfilial').AsInteger := TUserSession.GetInstance.FilialTrabalhoID;
  qryTotais.Open;
end;

procedure TFrmConsultaOrdens.InicializarFormulario;
begin
  InicializarDatas;
  CarregarOrdensPendente;
  CarregarTotaisPendente;
  VerificarPermissoesUsuario;

  grpPesquisaAvancada.Visible:= False;
  dbgrdOrdens.Height:= 406;
  dbgrdOrdens.Top:= 100;
end;



procedure TFrmConsultaOrdens.PrepareOrdensQuery(const ATexto: string);
var
  isNumeric: Boolean;
begin
  isNumeric := StrToIntDef(ATexto, 0) <> 0;

  qryConsultaOrdem.SQL.Clear;
  qryConsultaOrdem.SQL.Add('Select * from view_consulta_ordem');

  qryTotais.SQL.Clear;
  qryTotais.SQL.Add('Select count(*) as Quantidade, sum(VProduto + VServico) as VTotal from view_consulta_ordem');

  if isNumeric then
    begin
      qryTotais.SQL.Add('where id_ordem_servico = :id_ordem');
      qryConsultaOrdem.SQL.Add('where id_ordem_servico = :id_ordem');
      qryTotais.ParamByName('id_ordem').AsInteger := StrToInt(ATexto);
      qryConsultaOrdem.ParamByName('id_ordem').AsInteger := StrToInt(ATexto);
    end
  else
    begin
      qryTotais.SQL.Add('where nome like :nome');
      qryConsultaOrdem.SQL.Add('where nome like :nome');
      qryTotais.ParamByName('nome').AsString := '%' + ATexto + '%';
      qryConsultaOrdem.ParamByName('nome').AsString := '%' + ATexto + '%';
    end;
end;


Procedure TFrmConsultaOrdens.PreparePendingQuery;
begin
  qryTotais.SQL.Clear;
  qryTotais.SQL.Add('Select count(*) as Quantidade, sum(VProduto + VServico) as VTotal from view_consulta_ordem where situacao = ''Pendente''');

  qryConsultaOrdem.SQL.Clear;
  qryConsultaOrdem.SQL.Add('Select * from view_consulta_ordem where situacao = ''Pendente''');
end;

procedure TFrmConsultaOrdens.PrepareObjetoQuery(const AObjeto: string);
begin
  qryConsultaOrdem.SQL.Clear;
  qryConsultaOrdem.SQL.Add('Select * from view_consulta_ordem where Objeto1 = :obj or Objeto2 = :obj or Objeto3 = :obj');
  qryConsultaOrdem.SQL.Add('or Objeto4 = :obj or Objeto5 = :obj or Objeto6 = :obj');
  qryConsultaOrdem.SQL.Add('or Objeto7 = :obj or identificacao = :obj or objeto_adicional1 = :obj or objeto_adicional2 = :obj');

  qryTotais.SQL.Clear;
  qryTotais.SQL.Add('Select count(*) as Quantidade, sum(VProduto + VServico) as VTotal from view_consulta_ordem where Objeto1 = :obj or Objeto2 = :obj or Objeto3 = :obj');
  qryTotais.SQL.Add('or Objeto4 = :obj or Objeto5 = :obj or Objeto6 = :obj');
  qryTotais.SQL.Add('or Objeto7 = :obj or identificacao = :obj or objeto_adicional1 = :obj or objeto_adicional2 = :obj');

  qryConsultaOrdem.ParamByName('obj').AsString := AObjeto;
  qryTotais.ParamByName('obj').AsString := AObjeto;
end;

procedure TFrmConsultaOrdens.PrepareDataQuery(const ADataFinal: TDate);
var
  situacao: string;
  filialID: Integer;
begin
  situacao := cbSituacao.Items[cbSituacao.ItemIndex];
  filialID := cbFilial.ItemIndex;

  qryConsultaOrdem.SQL.Clear;
  qryTotais.SQL.Clear;

  qryConsultaOrdem.SQL.Add('Select * from view_consulta_ordem');
  qryTotais.SQL.Add('Select count(*) as Quantidade, sum(VProduto + VServico) as VTotal from view_consulta_ordem');

  if cbFilial.Items[filialID] = '(TODAS)' then
  begin
    qryConsultaOrdem.SQL.Add('where situacao = :situacao and data_hora_cadastro between :datainicial and :datafinal');
    qryTotais.SQL.Add('where situacao = :situacao and data_hora_cadastro between :datainicial and :datafinal');
  end
  else
  begin
    qryConsultaOrdem.SQL.Add('where situacao = :situacao and id_filial = :filial and data_hora_cadastro between :datainicial and :datafinal');
    qryTotais.SQL.Add('where situacao = :situacao and id_filial = :filial and data_hora_cadastro between :datainicial and :datafinal');
    qryConsultaOrdem.ParamByName('filial').AsInteger := filialID;
    qryTotais.ParamByName('filial').AsInteger := filialID;
  end;

  qryConsultaOrdem.ParamByName('situacao').AsString := situacao;
  qryConsultaOrdem.ParamByName('datainicial').AsDate := EdtDataInicial.Date;
  qryConsultaOrdem.ParamByName('datafinal').AsDate := ADataFinal;

  qryTotais.ParamByName('situacao').AsString := situacao;
  qryTotais.ParamByName('datainicial').AsDate := EdtDataInicial.Date;
  qryTotais.ParamByName('datafinal').AsDate := ADataFinal;
end;

procedure TFrmConsultaOrdens.VerificarPermissoesUsuario;
begin
  if TUserSession.GetInstance.PerfilID <> 1 then
    BtnEstornar.Visible := False;  // Oculta o botão se o usuário não for administrador
end;

procedure TFrmConsultaOrdens.scGPGlyphButton10Click(Sender: TObject);
begin
  Self.WindowState := wsMinimized;
end;

procedure TFrmConsultaOrdens.scGPGlyphButton9Click(Sender: TObject);
begin
  close;
end;

procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;


procedure TFrmConsultaOrdens.BtnAlterarClick(Sender: TObject);
begin
  if qryConsultaOrdem.FieldByName('Situacao').AsString <> 'Faturada' then
    begin
      view_principal.ehEdicaoOrdem:= 1;
      idCliente := qryConsultaOrdem.FieldByName('id_cliente').AsInteger;

      // Verifica se o formulário já foi criado, se não, cria
      if not Assigned(FrmOrdemServicos) then
        FrmOrdemServicos := TFrmOrdemServicos.Create(self);
        ehEdicaoOrdem := 1;

      try
        FrmOrdemServicos.ShowModal;
      finally
        FreeAndNil(FrmOrdemServicos);
      end;
    end
  else
  begin
    Application.MessageBox('Ordem de Serviço já Faturada!', 'Aviso', mb_Ok + mb_IconExclamation);
  end;
end;


procedure TFrmConsultaOrdens.btnCancelarClick(Sender: TObject);
begin
 if qryConsultaOrdem.FieldByName('Situacao').AsString <> 'Faturada' then
    begin
      if MessageDlg('Deseja cancelar a OS?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          cancelar_ordem(dbgrdOrdens.Columns[0].Field.AsInteger);
          qryConsultaOrdem.Refresh;
        end;
    end
 else
    begin
       Application.MessageBox('Ordem de Serviço já Faturada!','Aviso',mb_Ok+mb_IconExclamation);
    end;
end;

procedure TFrmConsultaOrdens.BtnEstornarClick(Sender: TObject);
begin
 if qryConsultaOrdem.FieldByName('Situacao').AsString = 'Cancelada' then
    begin
      if MessageDlg('Deseja estornar a OS?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          estornar_ordem(dbgrdOrdens.Columns[0].Field.AsInteger);
          qryConsultaOrdem.Refresh;
        end;
    end
 else
    begin
       Application.MessageBox('Ordem de Serviço não está Cancelada!','Aviso',mb_Ok+mb_IconExclamation);
    end;
end;

procedure TFrmConsultaOrdens.BtnExportarClick(Sender: TObject);
begin
  FrmExportar := TFrmExportar.Create(self);
  FrmExportar.Show;

end;

procedure TFrmConsultaOrdens.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaOrdens.BtnImprimirClick(Sender: TObject);
var
  caminho : string;
  filePath: string;

begin
   caminho := PegaTempDir;
   view_principal.idOrdemServico := dbgrdOrdens.Fields[0].AsInteger;
   filePath := caminho + '\Ordem Serviço ' + IntToStr(view_principal.idOrdemServico) + '.pdf';


   if qryConsultaOrdem.FieldByName('id_filial').AsInteger = 1 then
      begin
         FrmRelSeta := TFrmRelSeta.Create(Self);
         FrmRelSeta.Qrep.ExportToFilter(TQRPDFDocumentFilter.Create(filePath));
         OpenPDF(filePath, SW_SHOWMAXIMIZED);
         FrmRelSeta.Close;
      end
   else
   if qryConsultaOrdem.FieldByName('id_filial').AsInteger = 2 then
      begin
         FrmRelTCM := TFrmRelTCM.Create(Self);
         FrmRelTCM.Qrep.ExportToFilter(TQRPDFDocumentFilter.Create(filePath));
         OpenPDF(filePath, SW_SHOWMAXIMIZED);
         FrmRelTCM.Close;
      end
   else
      begin
         Application.MessageBox('Ordem Sem Filial Selecionada!','Aviso',mb_Ok+MB_ICONWARNING);
      end;
end;

procedure TFrmConsultaOrdens.BtnNovaOSClick(Sender: TObject);
begin
  ehEdicaoOrdem := 0;
  FrmOrdemServicos := TFrmOrdemServicos.Create(self);
  try
    FrmOrdemServicos.ShowModal;
  finally
    FreeAndNil(FrmOrdemServicos);
  end;

end;

procedure TFrmConsultaOrdens.BtnPesquisaClick(Sender: TObject);
var
  dataFinal: TDate;
begin
  if not grpPesquisaAvancada.Visible then
    begin
      BtnPesquisa.Caption := 'Aplicar Filtros';
      dbgrdOrdens.Height := 306;
      dbgrdOrdens.Top := 200;
      grpPesquisaAvancada.Visible := True;
    end
  else
    begin
      qryConsultaOrdem.Close;
      qryTotais.Close;

      if EdtObjeto.Text <> '' then
        begin
          PrepareObjetoQuery(EdtObjeto.Text);
        end
      else
        begin
          dataFinal := IncDay(EdtDataFinal.Date, 1);
          PrepareDataQuery(dataFinal);
        end;

      qryConsultaOrdem.Open;
      qryTotais.Open;
    end;
end;

procedure TFrmConsultaOrdens.dbgrdOrdensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

   If odd(qryConsultaOrdem.RecNo) then
      begin
         dbgrdOrdens.Canvas.Font.Color:= clBlack;
         dbgrdOrdens.Canvas.Brush.Color:= cl3DLight;
      end
   else
      begin
         dbgrdOrdens.Canvas.Font.Color:= clBlack;
         dbgrdOrdens.Canvas.Brush.Color:= clWhite;
      end;

   if (gdSelected in state) then
      begin
      dbgrdOrdens.Canvas.Font.Color:= clWhite;
      dbgrdOrdens.Canvas.Brush.Color:= clBlue;
      end
   else
      dbgrdOrdens.Canvas.Font.Color:= clBlack;

   dbgrdOrdens.Canvas.FillRect(Rect);
   dbgrdOrdens.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmConsultaOrdens.EdtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
      begin
        qryConsultaOrdem.Close;

        if EdtPesquisa.Text <> '' then
          begin
            PrepareOrdensQuery(EdtPesquisa.Text);
          end
        else
          begin
            PreparePendingQuery;
          end;

        qryConsultaOrdem.Open;
        qryTotais.Open;
      end;
end;

procedure TFrmConsultaOrdens.FormDestroy(Sender: TObject);
begin
  if Assigned(qryConsultaOrdem) then
    begin
      qryConsultaOrdem.Close;
      qryConsultaOrdem.Free;
      qryConsultaOrdem := nil;
    end;
end;


procedure TFrmConsultaOrdens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      btnFecharClick(self);
    VK_F12:
      BtnPesquisaClick(self);
  end;
end;

procedure TFrmConsultaOrdens.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Width := 3; // Largura da borda
  Canvas.Pen.Color := $009A572B; // Cor da borda
  Canvas.Rectangle(0, 0, Width, Height);
end;

procedure TFrmConsultaOrdens.FormShow(Sender: TObject);
begin
  InicializarFormulario;
end;

end.

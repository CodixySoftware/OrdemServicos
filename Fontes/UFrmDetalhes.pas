unit UFrmDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,ShellAPI,QRPDFFilt,Math;

type
  TFrmDetalhe = class(TForm)
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    grpDetalhes: TGroupBox;
    lblOrdem: TLabel;
    lblSituacao: TLabel;
    EdtOrdem: TEdit;
    cbSituacao: TComboBox;
    cbFilial: TComboBox;
    lblFilial: TLabel;
    BtnImprimir: TBitBtn;
    Label1: TLabel;
    cbMotivo: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
    procedure cbSituacaoSelect(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FrmDetalhe: TFrmDetalhe;

implementation

uses
  UOrdemServicos, UProcedures, UFrmMenu, UFrmRelTCM, URelOrdemSeta, UFrmConsultaOrdens,
  UserData, view.Principal, UDmOrdemServicos;

{$R *.dfm}
procedure OpenPDF(aFile : TFileName; TypeForm : Integer = SW_NORMAL);
var
  Pdir: PChar;
begin
  GetMem(pDir, 256);
  StrPCopy(pDir, aFile);
  ShellExecute(0, nil, Pchar(aFile), nil, Pdir, TypeForm);
  FreeMem(pdir, 256);
end;

procedure TFrmDetalhe.btnConfirmarClick(Sender: TObject);
var
  situacao, filial, subTipo, ehOrcamento: Integer;
begin
  ehOrcamento := FrmOrdemServicos.ehOrcamento;

  situacao := Integer(cbSituacao.Items.Objects[cbSituacao.ItemIndex]);

  //Caso a opção selecionada seja 7 - Aprovado o mesmo altera para Pendente
  if situacao = 7 then
     situacao := 0;

  if ehOrcamento = 1 then
     subTipo := Integer(cbMotivo.Items.Objects[cbMotivo.ItemIndex]);

   // Definir filial com base no ItemIndex
  filial := IfThen(cbFilial.ItemIndex = 0, 2, 1);

  // Chamar a função detalhes apenas se idOrdemServico for válido
  if FrmOrdemServicos.idOrdemServico > 0 then
    detalhes(FrmOrdemServicos.idOrdemServico, situacao, filial,ehOrcamento,subTipo);

  // Fechar as telas na ordem correta
  FrmDetalhe.Close;
  FrmOrdemServicos.Close;

end;

procedure TFrmDetalhe.btnFecharClick(Sender: TObject);
begin
  FrmOrdemServicos.Close;
  FrmDetalhe.Close;
end;

procedure TFrmDetalhe.BtnImprimirClick(Sender: TObject);
var
  caminho: string;
  filePath: string;
begin
  caminho := PegaTempDir;
  btnConfirmarClick(self);
  filePath := caminho + '\Ordem Serviço ' + IntToStr(view_principal.idOrdemServico) + '.pdf';

  if cbFilial.ItemIndex = 1 then
      begin
         FrmRelSeta := TFrmRelSeta.Create(Self);
         FrmRelSeta.Qrep.ExportToFilter(TQRPDFDocumentFilter.Create(filePath));
         OpenPDF(filePath, SW_SHOWMAXIMIZED);
         FrmRelSeta.Close;
      end
  else
      begin
         FrmRelTCM := TFrmRelTCM.Create(Self);
         FrmRelTCM.Qrep.ExportToFilter(TQRPDFDocumentFilter.Create(filePath));
         OpenPDF(filePath, SW_SHOWMAXIMIZED);
         FrmRelTCM.Close;
      end;
end;

procedure TFrmDetalhe.cbSituacaoSelect(Sender: TObject);
var
  Visivel: Boolean;
begin
  Visivel := (cbSituacao.ItemIndex = 2);
  Label1.Visible := Visivel;
  cbMotivo.Visible := Visivel;
end;

procedure TFrmDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmDetalhe := Nil;
end;

procedure TFrmDetalhe.FormCreate(Sender: TObject);
var
  FilialID: Integer;
begin
  FrmDetalhe.Caption := 'Detalhes da Ordem de Serviço';

  FilialID := TUserSession.GetInstance.FilialTrabalhoID;

  case FilialID of
    2: cbFilial.ItemIndex := 0;
    1: cbFilial.ItemIndex := 1;
  end;

  if FrmOrdemServicos.ehOrcamento = 1 then
      begin
        FrmDetalhe.Caption := 'Detalhe do Orçamento';
        cbSituacao.Clear;
        cbSituacao.Items.AddObject('Aguardando Aprovação',TObject(6));
        cbSituacao.Items.AddObject('Aprovado',TObject(7));
        cbSituacao.Items.AddObject('Perdido',TObject(8));

        cbMotivo.Clear;
        cbMotivo.Items.AddObject('Perdido - Preço',TObject(9));
        cbMotivo.Items.AddObject('Perdido - Concorrência',TObject(10));
        cbMotivo.Items.AddObject('Perdido - Prazo',TObject(11));
        cbSituacao.ItemIndex := 0;
        cbMotivo.ItemIndex := 0;
      end
  else
      begin
        cbSituacao.Clear;
        cbSituacao.Items.AddObject('Pendente',TObject(0));
        cbSituacao.Items.AddObject('Finalizada',TObject(2));
        cbSituacao.ItemIndex := 0;
      end;



end;

procedure TFrmDetalhe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = Vk_f3 then
    begin
      btnConfirmarClick(self);
    end;
  if Key = VK_ESCAPE then
    begin
      btnFecharClick(self);
    end;
end;


end.

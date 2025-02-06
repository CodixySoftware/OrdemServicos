unit UFrmDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,ShellAPI,QRPDFFilt;

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
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FrmDetalhe: TFrmDetalhe;

implementation

uses
  UOrdemServicos, UProcedures, UFrmMenu, UFrmRelTCM, URelOrdemSeta, UFrmConsultaOrdens,
  UserData, view.Principal;

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
  situacao,Filial: Integer;
begin
  if cbSituacao.ItemIndex = 0 then
    begin
      situacao:= 0;
    end;
  if cbSituacao.ItemIndex = 1 then
    begin
      situacao := 2;
    end;
  if cbSituacao.ItemIndex = 3 then
    begin
      situacao:= 4;
    end;
  if cbSituacao.ItemIndex = 4 then
    begin
      situacao := 5;
    end;

  if cbFilial.ItemIndex = 0 then
     begin
       filial:= 2;
     end
  else
    begin
      filial:= 1;
    end;

  detalhes(FrmOrdemServicos.idOrdemServico,situacao,filial);
  FrmOrdemServicos.Close;
  FrmDetalhe.Close;

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

procedure TFrmDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmDetalhe := Nil;
end;

procedure TFrmDetalhe.FormCreate(Sender: TObject);
begin
  FrmDetalhe.Caption := 'Detalhes da Ordem de Serviço';
  if TUserSession.GetInstance.FilialTrabalhoID = 2 then
    begin
      cbFilial.ItemIndex := 0;
    end
  else if TUserSession.GetInstance.FilialTrabalhoID = 1 then
    begin
      cbFilial.ItemIndex := 1;
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

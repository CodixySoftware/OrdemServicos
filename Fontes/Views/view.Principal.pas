unit view.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, scGPExtControls,
  scModernControls, scGPControls, scControls, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, scDrawUtils, scGPImages, scImageCollection, scGPPagers,
  Vcl.ExtCtrls, System.UITypes;

type
  Tview_principal = class(TForm)
    scGPPanel3: TscGPPanel;
    lblHora: TscGPLabel;
    scGPToolPagerPage1: TscGPToolPagerPage;
    scGPToolGroupPanel2: TscGPToolGroupPanel;
    scGPButton4: TscGPButton;
    scGPToolGroupPanel3: TscGPToolGroupPanel;
    scGPButton1: TscGPButton;
    scGPButton2: TscGPButton;
    scGPImageCollection1: TscGPImageCollection;
    scGPVirtualImageList1: TscGPVirtualImageList;
    scGPToolGroupPanel4: TscGPToolGroupPanel;
    scGPButton9: TscGPButton;
    scGPButton10: TscGPButton;
    Timer1: TTimer;
    scGPToolGroupPanel1: TscGPToolGroupPanel;
    scGPButton6: TscGPButton;
    lblUser: TscGPLabel;
    Timer2: TTimer;
    scGPButton3: TscGPButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure scGPButton1Click(Sender: TObject);
    procedure scGPButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure scGPButton4Click(Sender: TObject);
    procedure scGPButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    ehEdicaoOrdem, idOrdemServico : Integer;
  end;

var
  view_principal: Tview_principal;

implementation

{$R *.dfm}

uses view.login, UOrdemServicos, UFrmConsultaOrdens, view.BuscaServicos,
     View.Almoxarifado.Requisicoes;

procedure Tview_principal.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Tview_principal.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := True; // Ativa o Timer ao abrir o formulário
end;

procedure Tview_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja realmente fechar a aplicação?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Action := caNone // Cancela o fechamento do formulário
  else
    Action := caFree; // Fecha o formulário e libera os recursos
end;

procedure Tview_principal.scGPButton1Click(Sender: TObject);
begin
  ehEdicaoOrdem := 0;
  FrmOrdemServicos := TFrmOrdemServicos.Create(self);
  try
    FrmOrdemServicos.ShowModal;
  finally
    FreeAndNil(FrmOrdemServicos);
  end;
end;

procedure Tview_principal.scGPButton2Click(Sender: TObject);
begin
  FrmConsultaOrdens := TFrmConsultaOrdens.Create(self);
  try
    FrmConsultaOrdens.ShowModal;
  finally
    FreeAndNil(FrmConsultaOrdens);
  end;
end;

procedure Tview_principal.scGPButton3Click(Sender: TObject);
begin
  frmConsultaRequisicoes := TfrmConsultaRequisicoes.Create(self);
  try
    frmConsultaRequisicoes.ShowModal;
  finally
    FreeAndNil(frmConsultaRequisicoes);
  end;
end;

procedure Tview_principal.scGPButton4Click(Sender: TObject);
begin
  FrmServicos := TFrmServicos.Create(self);
  try
    FrmServicos.ShowModal;
  finally
    FreeAndNil(FrmServicos);
  end;
end;


procedure Tview_principal.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not frmLogin.ValidoLogin then
    begin
      FrmLogin := TFrmLogin.Create(Application);
      try
        FrmLogin.ShowModal;
      finally
        FreeAndNil(frmLogin);
      end;
    end;
end;

procedure Tview_principal.Timer2Timer(Sender: TObject);
begin
  lblHora.Caption := TimeToStr(Now);
end;

end.

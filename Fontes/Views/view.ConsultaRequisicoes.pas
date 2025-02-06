unit view.ConsultaRequisicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, scControls, scGPControls;

type
  TfrmConsultaRequisicoes = class(TForm)
    pnlBarra: TscGPPanel;
    btnFechar: TscGPGlyphButton;
    btnMinimizar: TscGPGlyphButton;
    lblTitulo: TscLabel;
    btnIcone: TscGPGlyphButton;
    btnMaximizar: TscGPGlyphButton;
    scGPPanel1: TscGPPanel;
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
    procedure btnFecharClick(Sender: TObject);
    procedure InicializarDatas;
    procedure InicializarFormulario;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{$R *.dfm}

implementation




procedure TfrmConsultaRequisicoes.InicializarDatas;
begin
  EdtDataInicial.Date := IncMonth(Date, -1);  // Define a data inicial para um mês anterior
  EdtDataFinal.Date := Date;                  // Define a data final para a data atual
end;

procedure TfrmConsultaRequisicoes.InicializarFormulario;
begin
  grpPesquisaAvancada.Visible:= False;
  //dbgrdOrdens.Height:= 406;
  //dbgrdOrdens.Top:= 100;
end;

procedure TfrmConsultaRequisicoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.

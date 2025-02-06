unit View.Almoxarifado.Requisicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  scControls, scGPControls, scGrids, scDBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaRequisicoes = class(TForm)
    pnlBarra: TscGPPanel;
    btnFechar: TscGPGlyphButton;
    btnMinimizar: TscGPGlyphButton;
    lblTitulo: TscLabel;
    btnIcone: TscGPGlyphButton;
    btnMaximizar: TscGPGlyphButton;
    qryRequisicoes: TFDQuery;
    dtsRequisicoes: TDataSource;
    BitBtn1: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnImprimir: TBitBtn;
    BtnNovaOS: TBitBtn;
    dbgrdRequisicoes: TscDBGrid;
    grpBusca: TGroupBox;
    EdtPesquisa: TEdit;
    BtnPesquisa: TBitBtn;
    grpPesquisaAvancada: TGroupBox;
    lblPeriodo: TLabel;
    lblSituacao: TLabel;
    lblate: TLabel;
    lblFilial: TLabel;
    cbSituacao: TComboBox;
    cbFilial: TComboBox;
    edtDataInicial: TDateTimePicker;
    edtDataFinal: TDateTimePicker;
    procedure btnFecharClick(Sender: TObject);
    procedure InicializarFormulario;
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaRequisicoes: TfrmConsultaRequisicoes;

implementation

{$R *.dfm}

uses UDmPrincipal;

procedure TfrmConsultaRequisicoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaRequisicoes.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Width := 3; // Largura da borda
  Canvas.Pen.Color := $009A572B; // Cor da borda
  Canvas.Rectangle(0, 0, Width, Height);
end;

procedure TfrmConsultaRequisicoes.FormShow(Sender: TObject);
begin
  InicializarFormulario;
end;

procedure TfrmConsultaRequisicoes.InicializarFormulario;
begin
  grpPesquisaAvancada.Visible:= False;
  dbgrdRequisicoes.Height:= 482;
  dbgrdRequisicoes.Top:= 100;
end;

end.

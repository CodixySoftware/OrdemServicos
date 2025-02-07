unit view.BuscaServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, scControls, scGPControls, Vcl.ExtCtrls;

type
  TFrmServicos = class(TForm)
    dbgrdServicos: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    DtsServicos: TDataSource;
    qryServicos: TFDQuery;
    qryCategoria: TFDQuery;
    scGPPanel3: TscGPPanel;
    scGPGlyphButton9: TscGPGlyphButton;
    scGPGlyphButton10: TscGPGlyphButton;
    scLabel7: TscLabel;
    scGPGlyphButton12: TscGPGlyphButton;
    scGPGlyphButton14: TscGPGlyphButton;
    qryServicosid_servico: TFDAutoIncField;
    qryServicosnome: TStringField;
    qryServicospreco: TBCDField;
    qryServicossigla: TStringField;
    qryServicossituacao: TStringField;
    qryServicoscategoria: TStringField;
    qryServicosid_categoria: TIntegerField;
    qryServicosid_unidade_medida: TSmallintField;
    qryServicosid_classificacao_servico: TSmallintField;
    qryServicosid_situacao_tributaria_issqn: TSmallintField;
    qryServicosaliquota_issqn: TBCDField;
    qryServicosfator_base_calculo_issqn: TBCDField;
    qryServicosid_situacao_tributaria_pis: TSmallintField;
    qryServicosaliquota_pis: TBCDField;
    qryServicosfator_base_calculo_pis: TBCDField;
    qryServicosaliquota_pis_st: TBCDField;
    qryServicosfator_base_calculo_pis_st: TBCDField;
    qryServicosid_situacao_tributaria_cofins: TSmallintField;
    qryServicosaliquota_cofins: TBCDField;
    qryServicosfator_base_calculo_cofins: TBCDField;
    qryServicosaliquota_cofins_st: TBCDField;
    qryServicosfator_base_calculo_cofins_st: TBCDField;
    qryServicosnatureza_operacao_issqn: TSmallintField;
    qryServicossituacao_1: TSmallintField;
    tmrPesquisa: TTimer;
    Label1: TLabel;
    edtPesquisa: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgrdServicosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgrdServicosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure scGPGlyphButton9Click(Sender: TObject);
    procedure dbgrdServicosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    var
      tipo:Integer;
  end;

var
  FrmServicos: TFrmServicos;

implementation

uses
  UDmCadServicos, UOrdemServicos, UCadServicos, UDmPrincipal;

{$R *.dfm}

procedure TFrmServicos.btnAlterarClick(Sender: TObject);
begin
  FrmCadServicos := TFrmCadServicos.Create(self);
  qryServicos.Edit;
  qryCategoria.Edit;
  FrmCadServicos.ShowModal;

end;

procedure TFrmServicos.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmServicos.btnNovoClick(Sender: TObject);
begin
   FrmCadServicos := TFrmCadServicos.Create(self);
   qryServicos.Append;
   FrmCadServicos.ShowModal;
end;

procedure TFrmServicos.btnSelecionarClick(Sender: TObject);
begin
  dbgrdServicosDblClick(self);
end;

procedure TFrmServicos.dbgrdServicosDblClick(Sender: TObject);
begin
  FrmOrdemServicos.EdtCodServico.Text := IntToStr(dbgrdServicos.Fields[0].AsInteger);
  FrmOrdemServicos.EdtCodServicoExit(Self);
  FrmOrdemServicos.EdtQuantidadeServico.SetFocus;
  FrmServicos.Close;

end;

procedure TFrmServicos.dbgrdServicosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  GridWidth, ColWidth: Integer;
begin
  // Pegando largura disponível (descontando a borda)
  GridWidth := dbgrdServicos.ClientWidth - 30; // Reduzindo para evitar barra horizontal

  // Definir a largura proporcionalmente
  dbgrdServicos.Columns[0].Width := Round(GridWidth * 0.10); // Código (10%)
  dbgrdServicos.Columns[1].Width := Round(GridWidth * 0.30); // Nome (30%)
  dbgrdServicos.Columns[2].Width := Round(GridWidth * 0.15); // Preço (15%)
  dbgrdServicos.Columns[3].Width := Round(GridWidth * 0.10); // Unid. (10%)
  dbgrdServicos.Columns[4].Width := Round(GridWidth * 0.15); // Situação (15%)
  dbgrdServicos.Columns[5].Width := Round(GridWidth * 0.20); // Categoria (20%)
end;


procedure TFrmServicos.dbgrdServicosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    dbgrdServicosDblClick(self);
end;

procedure TFrmServicos.edtPesquisaChange(Sender: TObject);
begin
  if Length(Trim(edtPesquisa.Text)) >= 3 then
    begin
      Screen.Cursor := crSQLWait; // Mostra o cursor de processamento
      try
        qryServicos.Close;
        qryServicos.ParamByName('pesquisa').AsString := '%' + Trim(edtPesquisa.Text) + '%';
        qryServicos.Open;
      finally
        Screen.Cursor := crDefault; // Retorna o cursor ao normal
      end;
    end;
end;

procedure TFrmServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmServicos := nil;
end;

procedure TFrmServicos.FormCreate(Sender: TObject);
begin
  qryServicos.Open;
  qryCategoria.Open;
end;

procedure TFrmServicos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnFecharClick(self);
end;

procedure TFrmServicos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (ActiveControl is TDBGrid) then
   Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmServicos.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Width := 3; // Largura da borda
  Canvas.Pen.Color := $009A572B; // Cor da borda
  Canvas.Rectangle(0, 0, Width, Height);
end;

procedure TFrmServicos.scGPGlyphButton9Click(Sender: TObject);
begin
  Close;
end;

end.

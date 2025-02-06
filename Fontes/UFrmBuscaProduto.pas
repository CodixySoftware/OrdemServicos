unit UFrmBuscaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmBuscaProduto = class(TForm)
    grpServicos: TGroupBox;
    edtPesquisa: TEdit;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFechar: TBitBtn;
    btnSelecionar: TBitBtn;
    dbgrdProduto: TDBGrid;
    DtsProduto: TDataSource;
    qryCadastroProduto: TFDQuery;
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdProdutoDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgrdProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscaProduto: TFrmBuscaProduto;

implementation

uses
   UOrdemServicos, UDmPrincipal;

{$R *.dfm}

procedure TFrmBuscaProduto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscaProduto.btnSelecionarClick(Sender: TObject);
begin
  dbgrdProdutoDblClick(self);
end;

procedure TFrmBuscaProduto.dbgrdProdutoDblClick(Sender: TObject);
begin
  FrmOrdemServicos.EdtCodigoProduto.Text := IntToStr(dbgrdProduto.Fields[0].AsInteger);
  FrmOrdemServicos.EdtCodigoProdutoExit(Self);
  FrmOrdemServicos.edtQuantidadeProduto.SetFocus;
  FrmBuscaProduto.Close;
end;

procedure TFrmBuscaProduto.dbgrdProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    dbgrdProdutoDblClick(self);
end;

procedure TFrmBuscaProduto.edtPesquisaChange(Sender: TObject);
begin
  with qryCadastroProduto do
    begin
      Close;
      ParamByName('pesquisa').AsString := '%' + edtPesquisa.Text + '%';
      Open;
    end;
end;

procedure TFrmBuscaProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    FrmBuscaProduto:= nil;
end;

procedure TFrmBuscaProduto.FormDestroy(Sender: TObject);
begin
  qryCadastroProduto.Close;
  qryCadastroProduto.Free;
  qryCadastroProduto := nil;
end;

procedure TFrmBuscaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnFecharClick(self);
end;

procedure TFrmBuscaProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (ActiveControl is TDBGrid) then
   Perform(WM_NEXTDLGCTL,0,0);
end;

end.

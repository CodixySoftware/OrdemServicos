unit UFrmServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB;

type
  TFrmServicos = class(TForm)
    grpServicos: TGroupBox;
    edtPesquisa: TEdit;
    dbgrdServicos: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    DtsServicos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgrdServicosDblClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgrdServicosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  UDmCadServicos, UOrdemServicos, UCadServicos;

{$R *.dfm}

procedure TFrmServicos.btnAlterarClick(Sender: TObject);
begin
  FrmCadServicos := TFrmCadServicos.Create(self);
  tipo:=2;
  FrmCadServicos.id_servico:= dbgrdServicos.Fields[0].AsInteger;
  FrmCadServicos.nome := dbgrdServicos.Fields[1].AsString;
  FrmCadServicos.preco := dbgrdServicos.Fields[2].AsCurrency;
  FrmCadServicos.situacao := dbgrdServicos.Fields[4].AsString;
  FrmCadServicos.ShowModal;

end;

procedure TFrmServicos.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmServicos.btnNovoClick(Sender: TObject);
begin
   FrmCadServicos := TFrmCadServicos.Create(self);
   tipo := 1;
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

procedure TFrmServicos.dbgrdServicosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    dbgrdServicosDblClick(self);
end;

procedure TFrmServicos.edtPesquisaChange(Sender: TObject);
begin
  DmCadastroServicos.QServicos.Close;
  DmCadastroServicos.QServicos.ParamByName('codservico').AsString := '%' + edtPesquisa.Text +  '%';
  DmCadastroServicos.QServicos.ParamByName('nome').AsString := '%' + edtPesquisa.Text +  '%';
  DmCadastroServicos.QServicos.Open;
end;

procedure TFrmServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmServicos := nil;
end;

procedure TFrmServicos.FormCreate(Sender: TObject);
begin
  DmCadastroServicos := TDmCadastroServicos.Create(self);
end;

procedure TFrmServicos.FormDestroy(Sender: TObject);
begin
  DmCadastroServicos.QServicos.Close;
  DmCadastroServicos.Free;
  DmCadastroServicos := nil;
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

end.

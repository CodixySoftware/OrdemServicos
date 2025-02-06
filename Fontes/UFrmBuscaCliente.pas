unit UFrmBuscaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmBuscaCliente = class(TForm)
    grpBusca: TGroupBox;
    edtbusca: TEdit;
    btnSelecionar: TButton;
    btnFechar: TButton;
    dsClientes: TDataSource;
    dbgClientes: TDBGrid;
    qryClientes: TFDQuery;
    qryUltimaOs: TFDQuery;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    lblUltimaOS: TLabel;
    lblTipoVenda: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtbuscaChange(Sender: TObject);
    procedure edtbuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure VerificarUltimaOS(IdEntidade: Integer; var UltimaDataOS: TDateTime; var ClientePossuiOS: Boolean);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  FrmBuscaCliente: TFrmBuscaCliente;

implementation

uses
  UOrdemServicos, UDmPrincipal;

{$R *.dfm}





procedure TFrmBuscaCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuscaCliente.btnSelecionarClick(Sender: TObject);
begin

  dbgClientesDblClick(self);
end;

procedure TFrmBuscaCliente.dbgClientesCellClick(Column: TColumn);
var
  UltimaDataOS: TDateTime;
  ClientePossuiOS: Boolean;
begin
  Memo1.Clear;
  Memo1.Text := qryClientes.FieldByName('observacao').AsString;

  // Chama a procedure para verificar a última OS do cliente
  VerificarUltimaOS(qryClientes.FieldByName('id_entidade').AsInteger, UltimaDataOS, ClientePossuiOS);

// Verifica se o cliente possui OS registrada
  if not ClientePossuiOS then
    begin
      lblUltimaOS.Caption := 'Sem OS Registrada';
      lblTipoVenda.Caption := 'Somente Venda à Vista';
      lblTipoVenda.Font.Color := clRed;
    end
  else
    begin
      // Exibe a última data de OS registrada
      lblUltimaOS.Caption := DateTimeToStr(UltimaDataOS);

      // Verifica se a última OS foi gerada há mais de 1 ano
      if UltimaDataOS < Now - 365 then
        begin
          lblTipoVenda.Caption := 'Somente Venda à Vista';
          lblTipoVenda.Font.Color := clRed;  // Destaca o aviso de restrição
        end
      else
        begin
          lblTipoVenda.Caption := 'Venda Faturado ou à Vista';
          lblTipoVenda.Font.Color := clGreen; // Cor neutra para venda liberada
        end;
    end;
end;

procedure TFrmBuscaCliente.dbgClientesDblClick(Sender: TObject);

begin
  // Verifica se o cliente está ativo
  if qryClientes.FieldByName('Situacao').AsString = 'ATIVO' then
  begin
    // Lança o cliente independente da notificação
    FrmOrdemServicos.edtCodigo.Text := qryClientes.FieldByName('id_entidade').AsString;
    FrmBuscaCliente.Close;
    FrmOrdemServicos.edtCodigo.SetFocus;
  end
  else
  begin
    Application.MessageBox('CLIENTE INATIVO!', 'Aviso', mb_Ok + mb_IconExclamation);
  end;
end;


procedure TFrmBuscaCliente.dbgClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_RETURN then
    dbgClientesDblClick(self);
end;

procedure TFrmBuscaCliente.edtbuscaChange(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.Params[0].AsString := '%' + edtbusca.Text +  '%';
  qryClientes.Open;
end;

procedure TFrmBuscaCliente.edtbuscaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    IF KEY = VK_ESCAPE THEN
      btnFecharClick(SENDER);
end;

procedure TFrmBuscaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmBuscaCliente := nil;
end;

procedure TFrmBuscaCliente.FormDestroy(Sender: TObject);
begin
  qryClientes.Close;
end;

procedure TFrmBuscaCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    btnFecharClick(self);
end;

procedure TFrmBuscaCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not (ActiveControl is TDBGrid) then
   Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmBuscaCliente.FormShow(Sender: TObject);
begin
  lblUltimaOS.Caption:= '';
  lblTipoVenda.Caption:= '';
end;

procedure TFrmBuscaCliente.VerificarUltimaOS(IdEntidade: Integer;
  var UltimaDataOS: TDateTime; var ClientePossuiOS: Boolean);
 begin
  with qryUltimaOS do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT MAX(data_hora_cadastro) AS ultima_os FROM ordem_servico WHERE id_entidade_cliente = :id_entidade_cliente');
    ParamByName('id_entidade_cliente').AsInteger := IdEntidade;
    Open;

    if not FieldByName('ultima_os').IsNull then
      begin
        UltimaDataOS := FieldByName('ultima_os').AsDateTime;
        ClientePossuiOS := True;
      end
    else
      begin
        UltimaDataOS := 0;  // Valor padrão caso não exista OS
        ClientePossuiOS := False;
      end;

  end;
end;

end.

unit view.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, scControls, scGPControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrBase, ACBrEnterTab;

type
  TfrmLogin = class(TForm)
    qryLogin: TFDQuery;
    ACBrEnterTab1: TACBrEnterTab;
    pnlImagem: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    pnlContato: TPanel;
    imgContato: TImage;
    pnlTitContato: TPanel;
    lblTitContato: TLabel;
    pnlRSociais: TPanel;
    imgRSociais: TImage;
    pnlTitRSociais: TPanel;
    lblTitRSociais: TLabel;
    pnlSuporte: TPanel;
    imgRemoto: TImage;
    pnlTitRemoto: TPanel;
    Label3: TLabel;
    pnlLogin: TPanel;
    pnlInfoLogin: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    scGPButton1: TscGPButton;
    scGPButton2: TscGPButton;
    procedure scGPButton1Click(Sender: TObject);
    procedure scGPButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    FLoginValido: Boolean;
  public
    property LoginValido: Boolean read FLoginValido;
    var
      ValidoLogin: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UDmPrincipal, UserData, UFrmMenu, UFrmConsultaOrdens, view.Principal;

procedure TfrmLogin.FormPaint(Sender: TObject);
begin
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Width := 4; // Largura da borda
  Canvas.Pen.Color := $004A4A4A; // Cor da borda
  Canvas.Rectangle(0, 0, Width, Height);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;


procedure TfrmLogin.scGPButton1Click(Sender: TObject);
var
  UserID, PerfilID, FilialTrabalhoID, userIdCategoria: Integer;
  UserName, categoriaName, filialApelido: string;
begin
  if (Trim(EdtUsuario.Text) = '') or (Trim(EdtSenha.Text) = '') then
    begin
      Application.MessageBox('Favor Informar Usuário e Senha!', 'Aviso', MB_OK + MB_ICONWARNING);
      FLoginValido := False;
      Exit;
    end;

  // Consulta para verificar o login
  qryLogin.Close;
  qryLogin.ParamByName('usuario').AsString := EdtUsuario.Text;
  qryLogin.ParamByName('senha').AsString := EdtSenha.Text;
  qryLogin.Open;

  if qryLogin.RecordCount = 0 then
      begin
        Application.MessageBox('Usuário ou Senha incorretos!', 'Aviso', MB_OK + MB_ICONWARNING);
        FLoginValido := False;
      end
  else
      begin
        // Obtém os valores do banco de dados
        UserName         := qryLogin.FieldByName('nome').AsString;
        UserID           := qryLogin.FieldByName('id_usuario').AsInteger;
        PerfilID         := qryLogin.FieldByName('id_perfil_usuario').AsInteger;
        FilialTrabalhoID := qryLogin.FieldByName('id_filial_trabalho').AsInteger;
        userIdCategoria  := qryLogin.FieldByName('id_categoria').AsInteger;
        categoriaName    := qryLogin.FieldByName('categoria').AsString;
        filialApelido    := qryLogin.FieldByName('razao_social').AsString;



        // Armazena as informações na sessão do usuário
        TUserSession.GetInstance.SetSession(UserID, PerfilID, FilialTrabalhoID,userIdCategoria,UserName,categoriaName,filialApelido);

        // Define o login como válido
        ValidoLogin := True;

        // Atualiza a barra de status no menu principal
        view_principal.lblUser.Caption := 'Usuário: ' + TUserSession.GetInstance.UserName +
                                          '    | Empresa: '+ TUserSession.GetInstance.FilialApelido +
                                          '    | Local de Trabalho: '+ TUserSession.GetInstance.CategoriaName;
        frmLogin.Close;

      end;
end;
procedure TfrmLogin.scGPButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

unit UFrmSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmSenha = class(TForm)
    imgFundo: TImage;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btnFechar: TSpeedButton;
    BtnConfirmar: TBitBtn;
    procedure btnFecharClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha: TFrmSenha;

implementation

uses
  UDmSenha, UFrmMenu, UserData;

{$R *.dfm}

procedure TFrmSenha.BtnConfirmarClick(Sender: TObject);
var
  UserID, PerfilID, FilialTrabalhoID: Integer;
  UserName: string;
begin
  if ((EdtUsuario.Text = '') or (EdtSenha.Text = '')) then
  begin
    Application.MessageBox('Favor Informar Usuário e Senha!', 'Aviso', mb_Ok + MB_ICONWARNING);
    Exit;
  end;

  DmSenha.QLogin.Close;
  DmSenha.QLogin.ParamByName('usuario').AsString := EdtUsuario.Text;
  DmSenha.QLogin.ParamByName('senha').AsString := EdtSenha.Text;
  DmSenha.QLogin.Open;

  if DmSenha.QLogin.RecordCount = 0 then
      begin
        Application.MessageBox('Usuário ou Senha incorretos!', 'Aviso', mb_Ok + MB_ICONWARNING);
      end
  else
      begin

        UserName := DmSenha.QLogin.FieldByName('nome').AsString;
        UserID := DmSenha.QLogin.FieldByName('id_usuario').AsInteger;
        PerfilID := DmSenha.QLogin.FieldByName('id_perfil_usuario').AsInteger;
        FilialTrabalhoID := DmSenha.QLogin.FieldByName('id_filial_trabalho').AsInteger;

        // Armazenando as informações na sessão do usuário



        FrmMenu.Statusbar.Panels[0].Text := 'USUÁRIO: ' + TUserSession.GetInstance.UserName;

        FrmMenu.Show;
        FrmSenha.Close;
      end;
end;


procedure TFrmSenha.btnFecharClick(Sender: TObject);
begin
  FrmMenu.Close;
  Close;
end;

procedure TFrmSenha.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
    BtnConfirmar.SetFocus;
end;

procedure TFrmSenha.EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =#13 then
    EdtSenha.SetFocus;
end;

procedure TFrmSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      btnFecharClick(self);
    end;
  if key = vk_f3 then
    begin
      BtnConfirmarClick(self);
    end;
end;

end.

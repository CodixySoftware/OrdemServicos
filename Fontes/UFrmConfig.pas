unit UFrmConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,IniFiles;

type
  TFrmConfig = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    EdtConexao: TEdit;
    EdtHost: TEdit;
    EdtBase: TEdit;
    EdtPorta: TEdit;
    EdtUser: TEdit;
    EdtSenha: TEdit;
    btnBtnConfirmar: TButton;
    btnBtnFechar: TButton;
    lblcopia: TLabel;
    EdtVias: TEdit;
    lblPorta: TLabel;
    cbPortas: TComboBox;
    procedure btnBtnConfirmarClick(Sender: TObject);
    procedure btnBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;
  ArqINI: TIniFile;
  Arquivo: string;

implementation

{$R *.dfm}

procedure TFrmConfig.btnBtnConfirmarClick(Sender: TObject);
begin
  ArqIni := TIniFile.Create(extractFilePath(ParamStr(0)) + 'Conf.ini');
  ArqIni.WriteString('Servidor Local', 'Conexão ', EdtConexao.Text);
  ArqIni.WriteString('Servidor Local', 'Host ', edthost.Text);
  ArqIni.WriteString('Servidor Local', 'Porta ', EdtPorta.Text);
  ArqIni.WriteString('Servidor Local', 'Base ', EdtBase.Text);
  ArqIni.WriteString('Servidor Local', 'Protocol ', 'mssql');
  ArqIni.WriteString('Servidor Local', 'User ', EdtUser.Text);
  ArqIni.WriteString('Servidor Local', 'Password ', EdtSenha.Text);
  ArqIni.WriteString('Servidor Local', 'Vias ', EdtVias.Text);
  ArqIni.WriteString('Servidor Local', 'Portas ', cbPortas.items[cbPortas.ItemIndex]);
  Close;
end;

procedure TFrmConfig.btnBtnFecharClick(Sender: TObject);
var
  arquivo : string;

begin
  arquivo := (extractFilePath(ParamStr(0)) + 'Conf.ini');
  if not FileExists(arquivo) then
    begin
     try
       Application.MessageBox('Favor Configurar o acesso ao Servidor!','Aviso',mb_Ok+MB_ICONWARNING);
     finally

     end;
    end
  else
    begin
      Close;
    end;

end;

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmConfig := Nil;
end;

procedure TFrmConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      Close;
    end;
  if key = VK_F3 then
    begin
      btnBtnConfirmarClick(self);
    end;
end;

procedure TFrmConfig.FormShow(Sender: TObject);
var
  arquivo : string;
  Ini: TIniFile;
begin
  arquivo := (extractFilePath(ParamStr(0)) + 'Conf.ini');
  if FileExists(arquivo) then
    begin
        Ini := TIniFile.Create(extractFilePath(ParamStr(0)) + 'Conf.ini');
        EdtConexao.Text := Ini.ReadString ('Servidor Local', 'Conexão', '');
        EdtHost.Text    := Ini.ReadString('Servidor Local', 'Host', '');
        EdtPorta.Text   := Ini.ReadString ('Servidor Local', 'Porta', '');
        EdtUser.Text    := Ini.ReadString ('Servidor Local', 'User', '');
        EdtSenha.Text   := Ini.ReadString ('Servidor Local', 'Password', '');
        EdtBase.Text    := Ini.ReadString ('Servidor Local', 'Base', '');
        EdtVias.Text    := IntToStr(Ini.ReadInteger('Servidor Local', 'Vias', 0));

    end;

end;

end.

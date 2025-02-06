unit UFrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFrmMenu = class(TForm)
    btnNovaOS: TBitBtn;
    btnConsultaOS: TBitBtn;
    Statusbar: TStatusBar;
    procedure btnConsultaOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    var
      origem_ordem, id_ordem,id_entidade,id_ordem_servico: Integer;
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses
  UOrdemServicos, UFrmConsultaOrdens, UFrmConfig, UDmPrincipal, UDmConsultaOrdem, UFrmSenha,
  view.login;

{$R *.dfm}


procedure TFrmMenu.btnConsultaOSClick(Sender: TObject);
begin
  FrmConsultaOrdens := TFrmConsultaOrdens.Create(Application);
  FrmConsultaOrdens.Show;
end;

end.

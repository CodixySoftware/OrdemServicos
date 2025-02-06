program Codixy;

uses
  Vcl.Forms,
  UOrdemServicos in 'Fontes\UOrdemServicos.pas' {FrmOrdemServicos},
  UDmPrincipal in 'Fontes\UDmPrincipal.pas' {DmPrincipal: TDataModule},
  UFrmBuscaCliente in 'Fontes\UFrmBuscaCliente.pas' {FrmBuscaCliente},
  UDmClientes in 'Fontes\UDmClientes.pas' {DmClientes: TDataModule},
  UTraducao in 'Fontes\UTraducao.pas',
  UProcedures in 'Fontes\UProcedures.pas',
  UDmServicos in 'Fontes\UDmServicos.pas' {DmServicos: TDataModule},
  view.BuscaServicos in 'Fontes\Views\view.BuscaServicos.pas' {FrmServicos},
  UDmCadServicos in 'Fontes\UDmCadServicos.pas' {DmCadastroServicos: TDataModule},
  UDmProdutos in 'Fontes\UDmProdutos.pas' {DmProdutos: TDataModule},
  UDmCadastroProduto in 'Fontes\UDmCadastroProduto.pas' {DmCadastroProduto: TDataModule},
  UFrmBuscaProduto in 'Fontes\UFrmBuscaProduto.pas' {FrmBuscaProduto},
  UFrmConfig in 'Fontes\UFrmConfig.pas' {FrmConfig},
  UFrmDetalhes in 'Fontes\UFrmDetalhes.pas' {FrmDetalhe},
  UCadServicos in 'Fontes\UCadServicos.pas' {FrmCadServicos},
  URelOrdemSeta in 'Fontes\URelOrdemSeta.pas' {FrmRelSeta},
  UFrmRelTCM in 'Fontes\UFrmRelTCM.pas' {FrmRelTCM},
  UFrmExportar in 'Fontes\UFrmExportar.pas' {FrmExportar},
  UDmExport in 'Fontes\UDmExport.pas' {DmExportar: TDataModule},
  UFrmSenha in 'Fontes\UFrmSenha.pas' {FrmSenha},
  UDmSenha in 'Fontes\UDmSenha.pas' {DmSenha: TDataModule},
  UserData in 'Fontes\controller\UserData.pas',
  view.login in 'Fontes\Views\view.login.pas' {frmLogin},
  UFrmMenu in 'Fontes\UFrmMenu.pas' {FrmMenu},
  UFrmConsultaOrdens in 'Fontes\UFrmConsultaOrdens.pas' {FrmConsultaOrdens},
  UDmOrdemServicos in 'Fontes\UDmOrdemServicos.pas' {DmOrdemServicos: TDataModule},
  UDmConsultaOrdem in 'Fontes\UDmConsultaOrdem.pas',
  DmRelatorios in 'Fontes\models\DmRelatorios.pas' {dmImpressao: TDataModule},
  view.Principal in 'Fontes\Views\view.Principal.pas' {view_principal},
  View.Almoxarifado.Requisicoes in 'Fontes\Views\View.Almoxarifado.Requisicoes.pas' {frmConsultaRequisicoes};

{frmLogin}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TTraducao.ChangeValues;
  Application.CreateForm(TDmPrincipal, DmPrincipal);
  Application.CreateForm(TDmSenha, DmSenha);
  Application.CreateForm(Tview_principal, view_principal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TfrmConsultaRequisicoes, frmConsultaRequisicoes);
  Application.Run;
end.

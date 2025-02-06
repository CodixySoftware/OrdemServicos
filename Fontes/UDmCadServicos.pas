unit UDmCadServicos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmCadastroServicos = class(TDataModule)
    QServicos: TZQuery;
    QCadEdit: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCadastroServicos: TDmCadastroServicos;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

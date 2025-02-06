unit UDmCadastroProduto;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmCadastroProduto = class(TDataModule)
    QCadProdutos: TZQuery;
    intgrfldQCadProdutosid_produto: TIntegerField;
    wdstrngfldQCadProdutosnome: TWideStringField;
    wdstrngfldQCadProdutossigla: TWideStringField;
    fltfldQCadProdutospreco_venda: TFloatField;
    wdstrngfldQCadProdutosid_ncm: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCadastroProduto: TDmCadastroProduto;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

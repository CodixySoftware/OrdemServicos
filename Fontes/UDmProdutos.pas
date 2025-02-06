unit UDmProdutos;

interface

uses
  System.SysUtils, System.Classes, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Datasnap.Provider, Data.DB, Datasnap.DBClient;

type
  TDmProdutos = class(TDataModule)
    QProdutos: TZQuery;
    QEditProduto: TZQuery;
    QGridProduto: TZQuery;
    QProdutoGeral: TZQuery;
    intgrfldQProdutosid_item_ordem_servico: TIntegerField;
    intgrfldQProdutosid_ordem_servico: TIntegerField;
    intgrfldQProdutosid_produto: TIntegerField;
    QProdutosid_variacao: TSmallintField;
    wdstrngfldQProdutoscodigo_barras: TWideStringField;
    fltfldQProdutosquantidade: TFloatField;
    fltfldQProdutosvalor_unitario: TFloatField;
    fltfldQProdutosvalor_total: TFloatField;
    fltfldQProdutosvalor_desconto_total: TFloatField;
    fltfldQProdutosvalor_acrescimo_total: TFloatField;
    wdstrngfldQProdutoshash_md5: TWideStringField;
    wdstrngfldQProdutosobservacao: TWideStringField;
    wdstrngfldQProdutosnumero_serie: TWideStringField;
    QProdutosid_usuario_vendedor: TSmallintField;
    QGridProdutoid_item_ordem_servico: TIntegerField;
    QGridProdutoid_produto: TIntegerField;
    QGridProdutonome: TWideStringField;
    QGridProdutoquantidade: TFloatField;
    QGridProdutovalor_unitario: TFloatField;
    QGridProdutovalor_desconto_total: TFloatField;
    QGridProdutovalor_acrescimo_total: TFloatField;
    QGridProdutovalor_total: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmProdutos: TDmProdutos;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

unit UDmRelatorio;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Datasnap.DBClient, Datasnap.Provider;

type
  TDmRelatorio = class(TDataModule)
    QServicos: TZQuery;
    QProdutos: TZQuery;
    QOrdem: TZQuery;
    QProdutosid_produto: TIntegerField;
    QProdutosnome: TWideStringField;
    QProdutosvalor_unitario: TFloatField;
    QProdutosquantidade: TFloatField;
    QProdutossigla: TWideStringField;
    QProdutosvalor_total: TFloatField;
    intgrfldQOrdemid_ordem_servico: TIntegerField;
    intgrfldQOrdemid_entidade_cliente: TIntegerField;
    wdstrngfldQOrdemnome: TWideStringField;
    wdstrngfldQOrdembairro: TWideStringField;
    wdstrngfldQOrdemlogradouro: TWideStringField;
    wdstrngfldQOrdemnumero_endereco: TWideStringField;
    wdstrngfldQOrdemfone_primario_nome_contato: TWideStringField;
    wdstrngfldQOrdemuf: TWideStringField;
    wdstrngfldQOrdemCidade: TWideStringField;
    wdstrngfldQOrdemcep: TWideStringField;
    wdstrngfldQOrdemfone_primario_ddd: TWideStringField;
    wdstrngfldQOrdemfone_primario_numero: TWideStringField;
    wdstrngfldQOrdemfone_secundario_ddd: TWideStringField;
    wdstrngfldQOrdemfone_primario_numero_1: TWideStringField;
    wdstrngfldQOrdememail: TWideStringField;
    wdmfldQOrdemobservacao: TWideMemoField;
    wdstrngfldQOrdemCPFCNPJ: TWideStringField;
    wdstrngfldQOrdemRGIE: TWideStringField;
    QObjeto: TZQuery;
    wdmfldQObjetodefeito_relatado: TWideMemoField;
    wdmfldQObjetodiagnostico: TWideMemoField;
    wdstrngfldQObjetoObjeto1: TWideStringField;
    wdstrngfldQObjetoObjeto2: TWideStringField;
    wdstrngfldQObjetoObjeto3: TWideStringField;
    wdstrngfldQObjetoObjeto4: TWideStringField;
    wdstrngfldQObjetoObjeto5: TWideStringField;
    wdstrngfldQObjetoObjeto6: TWideStringField;
    wdstrngfldQObjetoObjeto7: TWideStringField;
    intgrfldQServicosid_servico: TIntegerField;
    wdstrngfldQServicosnome: TWideStringField;
    fltfldQServicosValorUnit: TFloatField;
    fltfldQServicosquantidade: TFloatField;
    wdstrngfldQServicossigla: TWideStringField;
    fltfldQServicosTotal: TFloatField;
    dtmfldQOrdemdata_hora_cadastro: TDateTimeField;
    wdstrngfldQProdutosid_ncm: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatorio: TDmRelatorio;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

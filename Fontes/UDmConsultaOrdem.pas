unit UDmConsultaOrdem;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmConsultaOrdem = class(TDataModule)
    QConsultaOrdens: TZQuery;
    Query: TZQuery;
    QTotais: TZQuery;
    intgrfldQConsultaOrdensid_ordem_servico: TIntegerField;
    intgrfldQConsultaOrdensid_cliente: TIntegerField;
    wdstrngfldQConsultaOrdensnome: TWideStringField;
    fltfldQConsultaOrdensVProduto: TFloatField;
    fltfldQConsultaOrdensVServico: TFloatField;
    fltfldQConsultaOrdensVTotal: TFloatField;
    wdstrngfldQConsultaOrdensSituacao: TWideStringField;
    dtmfldQConsultaOrdensdata_hora_cadastro: TDateTimeField;
    dtmfldQConsultaOrdensdata_hora_faturamento: TDateTimeField;
    intgrfldQConsultaOrdensid_filial: TIntegerField;
    wdstrngfldQConsultaOrdensnome_filial: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto1: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto2: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto3: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto4: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto5: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto6: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto7: TWideStringField;
    wdstrngfldQConsultaOrdensidentificacao: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto_adicional1: TWideStringField;
    wdstrngfldQConsultaOrdensobjeto_adicional2: TWideStringField;
    fltfldQTotaisVTotal: TFloatField;
    intgrfldQTotaisQuantidade: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConsultaOrdem: TDmConsultaOrdem;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

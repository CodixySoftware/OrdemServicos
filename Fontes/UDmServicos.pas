unit UDmServicos;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Datasnap.Provider,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDmServicos = class(TDataModule)
    QServicos: TZQuery;
    QServicoGeral: TZQuery;
    intgrfldQServicosid_servico_ordem_servico: TIntegerField;
    intgrfldQServicosid_ordem_servico: TIntegerField;
    intgrfldQServicosid_servico: TIntegerField;
    fltfldQServicosquantidade: TFloatField;
    fltfldQServicosvalor_unitario: TFloatField;
    fltfldQServicosvalor_total: TFloatField;
    fltfldQServicosvalor_desconto_total: TFloatField;
    fltfldQServicosvalor_acrescimo_total: TFloatField;
    QServicosid_usuario_tecnico: TSmallintField;
    wdstrngfldQServicoshash_md5: TWideStringField;
    QGridServico: TZQuery;
    QEditServico: TZQuery;
    intgrfldQGridServicoid_servico_ordem_servico: TIntegerField;
    intgrfldQGridServicoid_servico: TIntegerField;
    wdstrngfldQGridServiconome: TWideStringField;
    wdstrngfldQGridServicoSigla: TWideStringField;
    fltfldQGridServicoquantidade: TFloatField;
    fltfldQGridServicovalor_unitario: TFloatField;
    fltfldQGridServicovalor_total: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmServicos: TDmServicos;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

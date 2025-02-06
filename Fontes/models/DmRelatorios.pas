unit DmRelatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmImpressao = class(TDataModule)
    qryServicos: TFDQuery;
    qryProdutos: TFDQuery;
    qryOrdem: TFDQuery;
    qryObjetos: TFDQuery;
    qryServicosid_servico: TIntegerField;
    qryServicosid_ordem_servico: TIntegerField;
    qryServicosnome: TStringField;
    qryServicosValorUnit: TFMTBCDField;
    qryServicosquantidade: TBCDField;
    qryServicossigla: TStringField;
    qryServicosTotal: TFloatField;
    qryProdutosid_produto: TIntegerField;
    qryProdutosnome: TStringField;
    qryProdutosvalor_unitario: TBCDField;
    qryProdutosquantidade: TBCDField;
    qryProdutossigla: TStringField;
    qryProdutosvalor_total: TBCDField;
    qryProdutosid_ncm: TStringField;
    qryProdutosid_ordem_servico: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImpressao: TdmImpressao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UDmPrincipal;

{$R *.dfm}

end.

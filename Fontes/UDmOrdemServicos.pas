unit UDmOrdemServicos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDmOrdemServicos = class(TDataModule)
    qGerarOrdem: TFDQuery;
    qBuscaClientes: TFDQuery;
    qObjeto: TFDQuery;
    qOrdem: TFDQuery;
    qOrdemServico: TFDQuery;
    qAtualizaOrdem: TFDQuery;
    qTotal: TFDQuery;
    qryGeneric: TFDQuery;
    qryServicos: TFDQuery;
    qryGridServicos: TFDQuery;
    qryProdutos: TFDQuery;
    qryGridProdutos: TFDQuery;
    qryGridProdutosid_item_ordem_servico: TFDAutoIncField;
    qryGridProdutosid_produto: TIntegerField;
    qryGridProdutosnome: TStringField;
    qryGridProdutosquantidade: TBCDField;
    qryGridProdutosvalor_unitario: TBCDField;
    qryGridProdutosvalor_desconto_total: TBCDField;
    qryGridProdutosvalor_acrescimo_total: TBCDField;
    qryGridProdutosvalor_total: TBCDField;
    qryGridServicosid_servico_ordem_servico: TFDAutoIncField;
    qryGridServicosid_servico: TIntegerField;
    qryGridServicosnome: TStringField;
    qryGridServicosSigla: TStringField;
    qryGridServicosquantidade: TBCDField;
    qryGridServicosvalor_unitario: TBCDField;
    qryGridServicosvalor_total: TBCDField;
    qTotalid_ordem_servico: TFDAutoIncField;
    qTotalvProduto: TFMTBCDField;
    qTotalvServico: TFMTBCDField;
    qTotalVTotal: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmOrdemServicos: TDmOrdemServicos;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

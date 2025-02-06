unit UFrmRelTCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qrpctrls, QRCtrls, QuickRpt,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmRelTCM = class(TForm)
    QRep: TQuickRep;
    qrbnd_titulo_pagina: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    qrshp3: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrshp4: TQRShape;
    qrm1: TQRMemo;
    qrshp5: TQRShape;
    txtid_servico1: TQRDBText;
    txtendereco: TQRDBText;
    QRLabel42: TQRLabel;
    txtnumero: TQRDBText;
    QRLabel43: TQRLabel;
    txtcontato: TQRDBText;
    txtcidade: TQRDBText;
    QRLabel44: TQRLabel;
    txtUF: TQRDBText;
    QRLabel45: TQRLabel;
    txtBairro: TQRDBText;
    QRLabel46: TQRLabel;
    txtcep: TQRDBText;
    QRLabel47: TQRLabel;
    txtTelefone: TQRDBText;
    QRLabel48: TQRLabel;
    txtfone_primario_ddd: TQRDBText;
    txtFone2: TQRDBText;
    txtddd2: TQRDBText;
    txtCNPJ: TQRDBText;
    txtIE: TQRDBText;
    txtemail: TQRDBText;
    txtid: TQRDBText;
    txtObjeto1: TQRDBText;
    txtObjeto2: TQRDBText;
    txtObjeto3: TQRDBText;
    txtObjeto4: TQRDBText;
    txtKm: TQRDBText;
    txtOrdem: TQRDBText;
    txtMotorista: TQRDBText;
    qrbnd_topo_pagina: TQRBand;
    QRLabel1: TQRLabel;
    qrlbl1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrmg1: TQRImage;
    qrshp1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrshp2: TQRShape;
    txt_ordem: TQRDBText;
    txtdata: TQRDBText;
    qrbnd_hearder_diagnostico: TQRBand;
    QRLabel20: TQRLabel;
    qrsbdtl_detail_diagnostico: TQRSubDetail;
    qrdbrchtxtdiagnostico1: TQRDBRichText;
    qrbnd_header_defeito: TQRBand;
    QRLabel19: TQRLabel;
    qrsbdtl_detail_defeito: TQRSubDetail;
    qrdbrchtxtdiagnostico: TQRDBRichText;
    qrbnd_header_servicos: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrshp6: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    qrsbdtl_detail_servico: TQRSubDetail;
    txtServico: TQRDBText;
    txtDescricao: TQRDBText;
    txtValor: TQRDBText;
    txtQuantidade: TQRDBText;
    txtUnidade: TQRDBText;
    txtTotal: TQRDBText;
    qrbnd_footer_servico: TQRBand;
    QRLabel35: TQRLabel;
    txtsubtotal: TQRPLabel;
    headerProdutos: TQRBand;
    QRLabel21: TQRLabel;
    qrshp7: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    detailProdutos: TQRSubDetail;
    txtnome: TQRDBText;
    txtid_servico: TQRDBText;
    txtValorUnit: TQRDBText;
    txtquantidade1: TQRDBText;
    txtsigla: TQRDBText;
    txtvalor_total: TQRDBText;
    txtNCM: TQRDBText;
    footerProdutos: TQRBand;
    QRLabel37: TQRLabel;
    txtprodutos: TQRPLabel;
    qrbnd_summary_totais: TQRBand;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    txtProdServ: TQRPLabel;
    txttotalordem: TQRPLabel;
    txtDesconto: TQRPLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelTCM: TFrmRelTCM;

implementation

uses
  UFrmConsultaOrdens, UFrmMenu, DmRelatorios, view.Principal;

{$R *.dfm}

procedure TFrmRelTCM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmRelTCM := nil;
end;

procedure TFrmRelTCM.FormCreate(Sender: TObject);
var
  servico,produto :Double;
begin
  DmImpressao := TDmImpressao.Create(self);
  DmImpressao.qryServicos.close;
  DmImpressao.qryProdutos.close;
  DmImpressao.qryOrdem.close;
  DmImpressao.qryObjetos.close;

  //Adicionar Where
  DmImpressao.qryServicos.SQL.Add('where id_ordem_servico = :idordemservico');
  DmImpressao.qryProdutos.SQL.Add('where id_ordem_servico = :idordemservico');
  DmImpressao.qryOrdem.SQL.Add('where id_ordem_servico = :idordemservico');
  DmImpressao.qryObjetos.SQL.Add('where id_ordem_servico = :idordemservico');


  DmImpressao.qryServicos.ParamByName('idordemservico').AsInteger := view_principal.idOrdemServico;
  DmImpressao.qryProdutos.ParamByName('idordemservico').AsInteger := view_principal.idOrdemServico;
  DmImpressao.qryOrdem.ParamByName('idordemservico').AsInteger := view_principal.idOrdemServico;
  DmImpressao.qryObjetos.ParamByName('idordemservico').AsInteger := view_principal.idOrdemServico;


  DmImpressao.qryServicos.Open;
  DmImpressao.qryProdutos.Open;
  DmImpressao.qryOrdem.Open;
  DmImpressao.qryObjetos.Open;
  Servico:= 0;
  while not DmImpressao.qryServicos.Eof do
    begin
     servico := servico + DmImpressao.qryServicos.FieldByName('total').AsFloat;
     DmImpressao.qryServicos.Next;
    end;
  txtsubtotal.Caption := (FormatFloat('R$ ###,###,#0.00',servico));
  produto:= 0;
  while not DmImpressao.qryProdutos.Eof do
    begin
      produto := produto + DmImpressao.qryProdutos.FieldByName('valor_total').AsFloat;
      DmImpressao.qryProdutos.Next;
    end;
  txtprodutos.Caption := (FormatFloat('R$ ###,###,#0.00',produto));
  txtProdServ.Caption := (FormatFloat('R$ ###,###,#0.00',servico+produto));
  txtDesconto.Caption := (FormatFloat('R$ ###,###,#0.00',0));
  txttotalordem.Caption := (FormatFloat('R$ ###,###,#0.00',servico+produto));
end;

procedure TFrmRelTCM.FormDestroy(Sender: TObject);
begin
  DmImpressao.qryServicos.close;
  DmImpressao.qryProdutos.close;
  DmImpressao.qryOrdem.close;
  DmImpressao.qryObjetos.close;
  DmImpressao.Free;
  DmImpressao := nil;
end;
end.


unit URelOrdemSeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  Vcl.Imaging.pngimage, qrpctrls;

type
  TFrmRelSeta = class(TForm)
    Qrep: TQuickRep;
    qrbnd_topo_pagina: TQRBand;
    QRLabel1: TQRLabel;
    qrlbl1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrmg1: TQRImage;
    qrbnd_titulo_pagina: TQRBand;
    qrshp1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrshp2: TQRShape;
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
    txt_ordem: TQRDBText;
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
    qrbnd_hearder_diagnostico: TQRBand;
    qrsbdtl_detail_diagnostico: TQRSubDetail;
    qrbnd_header_defeito: TQRBand;
    qrsbdtl_detail_defeito: TQRSubDetail;
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
    qrbnd_header_itens: TQRBand;
    QRLabel21: TQRLabel;
    qrshp7: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    qrsbdtl_detail_itens: TQRSubDetail;
    txtnome: TQRDBText;
    txtid_servico: TQRDBText;
    txtValorUnit: TQRDBText;
    txtquantidade1: TQRDBText;
    txtsigla: TQRDBText;
    txtvalor_total: TQRDBText;
    qrbnd_footer_itens: TQRBand;
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
    txtdata: TQRDBText;
    QRLabel36: TQRLabel;
    txtNCM: TQRDBText;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure qrsbdtl_detail_diagnosticoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbdtl_detail_defeitoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    var
      id_ordem: Integer;
  end;

var
  FrmRelSeta: TFrmRelSeta;

implementation

uses
  UFrmConsultaOrdens, UFrmMenu, DmRelatorios, view.Principal;

{$R *.dfm}

procedure TFrmRelSeta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmRelSeta := nil;
end;

procedure TFrmRelSeta.FormCreate(Sender: TObject);
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

procedure TFrmRelSeta.FormDestroy(Sender: TObject);
begin
  DmImpressao.qryServicos.close;
  DmImpressao.qryProdutos.close;
  DmImpressao.qryOrdem.close;
  DmImpressao.qryObjetos.close;
  DmImpressao.Free;
  DmImpressao := nil;
end;

procedure TFrmRelSeta.qrsbdtl_detail_defeitoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRMemo2.Lines.Text := dmImpressao.qryObjetos.FieldByName('diagnostico').AsString;
end;

procedure TFrmRelSeta.qrsbdtl_detail_diagnosticoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRMemo1.Lines.Text := dmImpressao.qryObjetos.FieldByName('defeito_relatado').AsString;
end;

end.

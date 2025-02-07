unit UCadServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Data.DB, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, cxDBEdit, JvExControls,
  JvDBLookup, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TFrmCadServicos = class(TForm)
    btnFechar: TBitBtn;
    btnConfirmar: TBitBtn;
    grpGeral: TGroupBox;
    lblDescricao: TLabel;
    lblValor: TLabel;
    edtDescricao: TDBEdit;
    dtsServicos: TDataSource;
    edtValor: TcxDBCurrencyEdit;
    chkAtivo: TDBCheckBox;
    dtsCategoria: TDataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label1: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    var
      nome,situacao:string;
      preco:Currency;
      id_servico,ativo:Integer;
  end;

var
  FrmCadServicos: TFrmCadServicos;

implementation

uses view.BuscaServicos,UProcedures;


{$R *.dfm}

procedure TFrmCadServicos.btnConfirmarClick(Sender: TObject);
begin
  with FrmServicos.qryServicos do
    begin
      FieldByName('id_unidade_medida').AsInteger := 1;
      FieldByName('id_classificacao_servico').AsInteger := 127;
      FieldByName('id_situacao_tributaria_issqn').AsInteger := 0;
      FieldByName('aliquota_issqn').AsFloat := 0.00;
      FieldByName('fator_base_calculo_issqn').AsFloat := 0.00;
      FieldByName('id_situacao_tributaria_pis').AsInteger := 99;
      FieldByName('aliquota_pis').AsFloat := 0.00;
      FieldByName('fator_base_calculo_pis').AsFloat := 0.00;
      FieldByName('aliquota_pis_st').AsFloat := 0.00;
      FieldByName('fator_base_calculo_pis_st').AsFloat := 0.00;
      FieldByName('id_situacao_tributaria_cofins').AsInteger := 99;
      FieldByName('aliquota_cofins').AsFloat := 0.00;
      FieldByName('fator_base_calculo_cofins').AsFloat := 0.00;
      FieldByName('aliquota_cofins_st').AsFloat := 0.00;
      FieldByName('fator_base_calculo_cofins_st').AsFloat := 0.00;
      FieldByName('natureza_operacao_issqn').AsInteger := 1;
      Post;
      Refresh;
    end;
  FrmCadServicos.Close;
end;


procedure TFrmCadServicos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  FrmCadServicos := Nil;
end;

procedure TFrmCadServicos.FormShow(Sender: TObject);
begin
  if FrmServicos.tipo = 2 then
    begin
      EdtDescricao.Text := nome;
      EdtValor.text:= floattostr(preco);
      if situacao = 'Ativo' then
        begin
          chkAtivo.Checked := false;
        end
      else
        begin
          chkAtivo.Checked := true;
        end;
    end
end;

end.

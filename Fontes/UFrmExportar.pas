unit UFrmExportar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,COMOBJ, Vcl.ComCtrls,DateUtils,
  Vcl.Mask;

type
  TFrmExportar = class(TForm)
    grpOpcoes: TGroupBox;
    btnConfirmar: TButton;
    btnFechar: TButton;
    lblFilial: TLabel;
    lblSituacao: TLabel;
    cbFilial: TComboBox;
    cbSituacao: TComboBox;
    lblPeriodo: TLabel;
    lblfIM: TLabel;
    lblbusca: TLabel;
    cbdata: TComboBox;
    EdtDataInicial: TDateTimePicker;
    EdtDataFinal: TDateTimePicker;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    var
      filial,situacao : Integer;
  public
    { Public declarations }
  end;

var
  FrmExportar: TFrmExportar;

implementation

uses
  UDmExport;

{$R *.dfm}

procedure TFrmExportar.btnConfirmarClick(Sender: TObject);
var objExcel,Sheet,Chart,s : Variant;
  cTitulo : string;
  i,count : integer;
  datafinal : TDate;
begin
  DmExportar.QExport.Close;
  DmExportar.QExport.SQL.Clear;
  DmExportar.QExport.SQL.Add('Select * from view_consulta_ordem');
  case cbdata.ItemIndex of
  0: DmExportar.QExport.SQL.Add('where data_hora_cadastro>= :datainicial and data_hora_cadastro<=:datafinal');
  1: DmExportar.QExport.SQL.Add('where data_hora_finalizacao>= :datainicial and data_hora_finalizacao<= :datafinal');
  2: DmExportar.QExport.SQL.Add('where data_hora_faturamento>= :datainicial and data_hora_faturamento<= :datafinal');
  end;
  if cbFilial.ItemIndex <> 0 then
    begin
      DmExportar.QExport.SQL.Add('and id_filial = :filial');
      DmExportar.QExport.ParamByName('filial').AsInteger := cbFilial.ItemIndex;
    end;
  if cbSituacao.ItemIndex <> 4 then
    begin
      DmExportar.QExport.SQL.Add('and situacao = :situacao');
      DmExportar.QExport.ParamByName('situacao').AsString := cbSituacao.Items[cbSituacao.ItemIndex];
    end;
  datafinal:= INCDAY(EdtDataFinal.Date,1);
  DmExportar.QExport.ParamByName('dataInicial').AsDate := EdtDataInicial.Date;
  DmExportar.QExport.ParamByName('dataFinal').AsDate := datafinal;
  DmExportar.QExport.open;

  count := DmExportar.QExport.RecordCount;
  i:= 2;
  //Criando documento
  cTitulo := ('Relatório de Ordem de Serviço');
  objExcel := CreateOleObject('Excel.Application');
  objExcel.Caption := cTitulo;
  objExcel.Visible := False;
  //Criando Planilha
  objExcel.Workbooks.Add;
  objExcel.Workbooks[1].Sheets.Add;
  objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
  Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];


  Sheet.Range['A1'] := 'ORDEM';
  Sheet.Range['B1'] := 'CLIENTE';
  Sheet.Range['C1'] := 'DATA DE EMISSÃO';
  if cbSituacao.Items[cbSituacao.ItemIndex] = 'FATURADA' then
    begin
      Sheet.Range['D1'] := 'DATA DE FATURAMENTO';
      Sheet.Range['E1'] := 'VALOR';
      Sheet.Range['F1'] := 'SITUACAO';
      Sheet.Range['G1'] := 'FILIAL';
    end
  else
    begin
      Sheet.Range['D1'] := 'VALOR';
      Sheet.Range['E1'] := 'SITUACAO';
      Sheet.Range['F1'] := 'FILIAL';
    end;
  DmExportar.QExport.DisableControls;
  try
    while not DmExportar.QExport.Eof  do
      begin
        Sheet.Cells[I,1]:= DmExportar.QExport.FieldByName('id_ordem_servico').AsInteger;
        Sheet.Cells[I,2]:= DmExportar.QExport.FieldByName('nome').AsString;
        Sheet.Cells[I,3]:= DmExportar.QExport.FieldByName('data_hora_cadastro').AsDateTime;
        if cbSituacao.Items[cbSituacao.ItemIndex] = 'FATURADA' then
          begin
            Sheet.Cells[I,4]:= DmExportar.QExport.FieldByName('data_hora_faturamento').Asdatetime;
            Sheet.Cells[I,5]:= DmExportar.QExport.FieldByName('VTotal').AsCurrency;
            Sheet.Cells[I,6]:= DmExportar.QExport.FieldByName('Situacao').AsString;
            Sheet.Cells[I,7]:= DmExportar.QExport.FieldByName('nome_filial').AsString;
          end
        else
          begin
            Sheet.Cells[I,4]:= DmExportar.QExport.FieldByName('VTotal').AsCurrency;
            Sheet.Cells[I,5]:= DmExportar.QExport.FieldByName('Situacao').AsString;
            Sheet.Cells[I,6]:= DmExportar.QExport.FieldByName('nome_filial').AsString;
          end;
        I:= I+1;
        DmExportar.QExport.Next;
      end;
      // Formatando o Cabeçalho
      Sheet.Range['A1','F1'].font.bold := true; // Negrito
      {Totalizando a planilha}
        if cbSituacao.Items[cbSituacao.ItemIndex] = 'FATURADA' then
          begin
            Sheet.Cells[i,4] := 'Total R$';
            Sheet.Cells[i,4].font.bold := true; // Negrito
            Sheet.Cells[i,5].font.bold := true;
            Sheet.Cells[i,5].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
            Sheet.Cells[i,5].formula := '=SUM(E2:E'+inttostr(i-1)+')';
          end
        else
          begin
            Sheet.Cells[i,3] := 'Total R$';
            Sheet.Cells[i,3].font.bold := true; // Negrito
            Sheet.Cells[i,4].font.bold := true;
            Sheet.Cells[i,4].NumberFormat := 'R$ #.##0,00_);(R$ #.##0,00)';
            Sheet.Cells[i,4].formula := '=SUM(D2:D'+inttostr(i-1)+')';
          end;
      objExcel.columns.autofit;
      objExcel.Visible := True;
  finally
    DmExportar.QExport.EnableControls;
    objExcel:= Unassigned;
  end;

end;

procedure TFrmExportar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExportar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmExportar := nil;
end;

procedure TFrmExportar.FormCreate(Sender: TObject);
begin
  EdtDataInicial.Date := INCMONTH(DATE,-1);;
  EdtDataFinal.Date:= date;
  DmExportar := TDmExportar.Create(self);
  DmExportar.QExport.ParamByName('situacaoOrdemServico').AsInteger := 0;
  DmExportar.QExport.ParamByName('idFilial').AsInteger := 0;
  DmExportar.QExport.Open;
end;

procedure TFrmExportar.FormDestroy(Sender: TObject);
begin
  DmExportar.QExport.Close;
  DmExportar.Free;
  DmExportar := nil;
end;

procedure TFrmExportar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      btnFecharClick(self);
    end;
end;

end.

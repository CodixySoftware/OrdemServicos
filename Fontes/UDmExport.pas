unit UDmExport;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TDmExportar = class(TDataModule)
    QExport: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmExportar: TDmExportar;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

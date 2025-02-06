unit UDmClientes;

interface

uses
  System.SysUtils, System.Classes,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmClientes = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmClientes: TDmClientes;

implementation

uses
  UDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

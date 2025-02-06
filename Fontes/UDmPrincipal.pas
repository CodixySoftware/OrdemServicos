unit UDmPrincipal;

interface

uses
  System.Classes,IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, System.SysUtils,
  XMLDoc, XMLIntf, FireDAC.DApt,Vcl.Dialogs, FireDAC.Phys.ODBCBase;

type
  TDmPrincipal = class(TDataModule)
    connPrincipal: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure ConfigureConnectionFromXML;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPrincipal.ConfigureConnectionFromXML;
var
  XMLDoc: IXMLDocument;
  RootNode, ServerNode, DatabaseNode, UserNode, PasswordNode: IXMLNode;
  XMLFilePath: string;
begin
  XMLFilePath := ExtractFilePath(ParamStr(0)) + 'config.xml';

  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.LoadFromFile(XMLFilePath);
  XMLDoc.Active := True;

  RootNode := XMLDoc.DocumentElement;

  ServerNode := RootNode.ChildNodes.FindNode('ServerName');
  DatabaseNode := RootNode.ChildNodes.FindNode('DatabaseName');
  UserNode := RootNode.ChildNodes.FindNode('UserName');
  PasswordNode := RootNode.ChildNodes.FindNode('Password');

  connPrincipal.Params.Clear;
  connPrincipal.LoginPrompt := False;
  connPrincipal.Params.Values['DriverID'] := 'MSSQL';  // Define o Driver como MSSQL
  connPrincipal.Params.Values['Server'] := ServerNode.Text;  // Nome ou IP do servidor
  connPrincipal.Params.Values['Database'] := DatabaseNode.Text;  // Nome do banco de dados
  connPrincipal.Params.Values['User_Name'] := UserNode.Text;  // Nome de usuário SQL
  connPrincipal.Params.Values['Password'] := PasswordNode.Text;  // Senha do usuário





  try
    connPrincipal.Connected := True;
  except
    on E: Exception do
      ShowMessage('Erro ao conectar: ' + E.Message);
  end;
end;


procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
begin
  DmPrincipal.ConfigureConnectionFromXML;
end;

end.

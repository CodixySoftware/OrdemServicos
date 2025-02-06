unit UserData;

interface

type
  TUserSession = class
  private
    FUserID: Integer;
    FPerfilID: Integer;
    FFilialTrabalhoID: Integer;
    FUserIdCategoria: Integer;
    FUserName: string; // Nome do usu�rio
    FCategoriaName: String;
    FFilialApelido: String;
    class var FInstance: TUserSession; // Inst�ncia singleton
    constructor Create; // Construtor privado
  public
    class function GetInstance: TUserSession; // M�todo para obter a inst�ncia
    procedure SetSession(AUserID, APerfilID, AFilialTrabalhoID, AUserIdCategoria: Integer; AUserName, ACategoriaName, AFilialApelido: string);

    property UserID: Integer read FUserID write FUserID;
    property PerfilID: Integer read FPerfilID write FPerfilID;
    property FilialTrabalhoID: Integer read FFilialTrabalhoID write FFilialTrabalhoID;
    property UserIdCategoria: Integer read FUserIdCategoria write FUserIdCategoria;
    property UserName: string read FUserName write FUserName; // Propriedade para o nome do usu�rio
    property CategoriaName: String read FCategoriaName write FCategoriaName;
    property FilialApelido: String read FFilialApelido write FFilialApelido;
  end;

implementation

{ TUserSession }

constructor TUserSession.Create;
begin
  // Inicializa��o se necess�rio
end;

class function TUserSession.GetInstance: TUserSession;
begin
  if not Assigned(FInstance) then
    FInstance := TUserSession.Create; // Cria a inst�ncia se n�o existir
  Result := FInstance;
end;

procedure TUserSession.SetSession(AUserID, APerfilID, AFilialTrabalhoID, AUserIdCategoria: Integer; AUserName, ACategoriaName, AFilialApelido: string);
begin
  FUserID := AUserID;
  FPerfilID := APerfilID;
  FFilialTrabalhoID := AFilialTrabalhoID;
  FUserIdCategoria := AUserIdCategoria;
  FUserName := AUserName; // Armazenando o nome do usu�rio
  FCategoriaName := ACategoriaName;
  FFilialApelido := AFilialApelido;
end;

end.


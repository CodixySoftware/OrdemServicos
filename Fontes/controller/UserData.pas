unit UserData;

interface

type
  TUserSession = class
  private
    FUserID: Integer;
    FPerfilID: Integer;
    FFilialTrabalhoID: Integer;
    FUserIdCategoria: Integer;
    FUserName: string; // Nome do usuário
    FCategoriaName: String;
    FFilialApelido: String;
    class var FInstance: TUserSession; // Instância singleton
    constructor Create; // Construtor privado
  public
    class function GetInstance: TUserSession; // Método para obter a instância
    procedure SetSession(AUserID, APerfilID, AFilialTrabalhoID, AUserIdCategoria: Integer; AUserName, ACategoriaName, AFilialApelido: string);

    property UserID: Integer read FUserID write FUserID;
    property PerfilID: Integer read FPerfilID write FPerfilID;
    property FilialTrabalhoID: Integer read FFilialTrabalhoID write FFilialTrabalhoID;
    property UserIdCategoria: Integer read FUserIdCategoria write FUserIdCategoria;
    property UserName: string read FUserName write FUserName; // Propriedade para o nome do usuário
    property CategoriaName: String read FCategoriaName write FCategoriaName;
    property FilialApelido: String read FFilialApelido write FFilialApelido;
  end;

implementation

{ TUserSession }

constructor TUserSession.Create;
begin
  // Inicialização se necessário
end;

class function TUserSession.GetInstance: TUserSession;
begin
  if not Assigned(FInstance) then
    FInstance := TUserSession.Create; // Cria a instância se não existir
  Result := FInstance;
end;

procedure TUserSession.SetSession(AUserID, APerfilID, AFilialTrabalhoID, AUserIdCategoria: Integer; AUserName, ACategoriaName, AFilialApelido: string);
begin
  FUserID := AUserID;
  FPerfilID := APerfilID;
  FFilialTrabalhoID := AFilialTrabalhoID;
  FUserIdCategoria := AUserIdCategoria;
  FUserName := AUserName; // Armazenando o nome do usuário
  FCategoriaName := ACategoriaName;
  FFilialApelido := AFilialApelido;
end;

end.


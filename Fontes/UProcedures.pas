unit UProcedures;

interface
  uses
  System.SysUtils, System.Variants, System.Classes, Winapi.Windows;

  function AbrirOrdem(idclient:integer):Boolean;
  function editarClienteOrdem(idOrdemServico, idCliente: Integer): Boolean;
  function editarServico(id_servico_ordem:integer):Boolean;
  function excluirServico(id_servico_ordem:integer):Boolean;
  function editarProduto(id_item_ordem:integer):Boolean;
  function excluirProduto(id_item_ordem:integer):Boolean;
  function atualizarOrdemServico(idOrdemServico:integer):Boolean;
  function detalhes(id_ordem,situacao,filial:integer):Boolean;
  function cancelar_ordem(id_ordem:integer):Boolean;
  function estornar_ordem(id_ordem:integer):Boolean;
  function  PegaTempDir : String;

implementation

uses
  UDmOrdemServicos, UOrdemServicos, UDmServicos, UDmProdutos, UFrmDetalhes, UDmCadServicos, UFrmMenu,
  UserData, UDmConsultaOrdem, view.Principal;

function AbrirOrdem(idclient: integer): Boolean;
var
  SQL: string;
begin
  Result := False;
  try
    SQL := 'INSERT INTO ORDEM_SERVICO ' +
           '(id_entidade_cliente, nome_cliente, fone_ddd_cliente, fone_numero_cliente, celular_ddd_cliente, ' +
           'celular_numero_cliente, email_cliente, id_categoria_ordem_servico, situacao, prioridade, ' +
           'aguardando_material, aguardando_aprovacao_orcamento, id_usuario_cadastro, data_hora_cadastro, ' +
           'data_hora_previsao, situacao_entrega, situacao_impressao, hash_md5, observacao, controle_interno, id_filial) ' +
           'VALUES ' +
           '(:id_entidade_cliente, :nome_cliente, :fone_ddd_cliente, :fone_numero_cliente, :celular_ddd_cliente, ' +
           ':celular_numero_cliente, :email_cliente, :id_categoria_ordem_servico, :situacao, :prioridade, ' +
           ':aguardando_material, :aguardando_aprovacao_orcamento, :id_usuario_cadastro, :data_hora_cadastro, ' +
           ':data_hora_previsao, :situacao_entrega, :situacao_impressao, :hash_md5, :observacao, :controle_interno, :id_filial); ' +
           'SELECT SCOPE_IDENTITY() AS id';

    DmOrdemServicos.QGerarOrdem.SQL.Clear;
    DmOrdemServicos.QGerarOrdem.SQL.Text := SQL;

    with DmOrdemServicos do
    begin
      QGerarOrdem.ParamByName('id_entidade_cliente').AsInteger := StrToInt(FrmOrdemServicos.edtCodigo.Text);
      QGerarOrdem.ParamByName('nome_cliente').AsString := FrmOrdemServicos.edtNome.Text;
      QGerarOrdem.ParamByName('fone_ddd_cliente').AsString := QBuscaClientes.FieldByName('fone_primario_ddd').AsString;
      QGerarOrdem.ParamByName('fone_numero_cliente').AsString := QBuscaClientes.FieldByName('fone_primario_numero').AsString;
      QGerarOrdem.ParamByName('celular_ddd_cliente').AsString := QBuscaClientes.FieldByName('fone_secundario_ddd').AsString;
      QGerarOrdem.ParamByName('celular_numero_cliente').AsString := QBuscaClientes.FieldByName('fone_secundario_numero').AsString;
      QGerarOrdem.ParamByName('email_cliente').AsString := QBuscaClientes.FieldByName('email').AsString;
      QGerarOrdem.ParamByName('id_categoria_ordem_servico').AsInteger := 1;
      QGerarOrdem.ParamByName('situacao').AsInteger := 0;
      QGerarOrdem.ParamByName('prioridade').AsInteger := 0;
      QGerarOrdem.ParamByName('aguardando_material').AsInteger := 0;
      QGerarOrdem.ParamByName('aguardando_aprovacao_orcamento').AsInteger := 0;
      QGerarOrdem.ParamByName('id_usuario_cadastro').AsInteger := TUserSession.GetInstance.UserID;
      QGerarOrdem.ParamByName('data_hora_cadastro').AsDateTime := Now;
      QGerarOrdem.ParamByName('data_hora_previsao').AsDateTime := Now;
      QGerarOrdem.ParamByName('situacao_entrega').AsInteger := 0;
      QGerarOrdem.ParamByName('situacao_impressao').AsInteger := 0;
      QGerarOrdem.ParamByName('hash_md5').AsString := '2e79996e1e6c281cf9c65073112ce4da';
      QGerarOrdem.ParamByName('observacao').AsString := '';
      QGerarOrdem.ParamByName('controle_interno').AsString := '';
      qGerarOrdem.ParamByName('id_filial').AsInteger := TUserSession.GetInstance.FilialTrabalhoID;
    end;

    DmOrdemServicos.QGerarOrdem.Open;
    FrmOrdemServicos.idOrdemServico := DmOrdemServicos.QGerarOrdem.FieldByName('ID').AsInteger;
    view_principal.idOrdemServico := DmOrdemServicos.QGerarOrdem.FieldByName('ID').AsInteger;
    Result := True;
  except
    on E: Exception do
      begin
        Result := False;
      end;
  end;
end;


function editarClienteOrdem(idOrdemServico, idCliente: Integer): Boolean;
begin
  Result := False; // Inicializa o resultado como falso para garantir consistência
  try
    with DmOrdemServicos.qryGeneric do
    begin
      SQL.Clear;
      SQL.Add('UPDATE ORDEM_SERVICO SET');
      SQL.Add('id_entidade_cliente = :id_entidade_cliente,');
      SQL.Add('nome_cliente = :nome_cliente,');
      SQL.Add('fone_ddd_cliente = :fone_ddd_cliente,');
      SQL.Add('fone_numero_cliente = :fone_numero_cliente,');
      SQL.Add('email_cliente = :email_cliente');
      SQL.Add('WHERE id_ordem_servico = :id_ordem_servico');

      // Passa os parâmetros necessários para a query
      ParamByName('id_entidade_cliente').AsInteger := idCliente; // Substitui por idCliente diretamente
      ParamByName('nome_cliente').AsString := FrmOrdemServicos.edtNome.Text;
      ParamByName('fone_ddd_cliente').AsString := DmOrdemServicos.QBuscaClientes.FieldByName('fone_primario_ddd').AsString;
      ParamByName('fone_numero_cliente').AsString := DmOrdemServicos.QBuscaClientes.FieldByName('fone_primario_numero').AsString;
      ParamByName('email_cliente').AsString := DmOrdemServicos.QBuscaClientes.FieldByName('email').AsString;
      ParamByName('id_ordem_servico').AsInteger := idOrdemServico;

      // Executa a consulta SQL
      ExecSQL;

      // Se tudo correr bem, a operação é bem-sucedida
      Result := True;
    end;
  except
    on E: Exception do
      Result := False;

  end;
end;

function editarServico(id_servico_ordem:integer):Boolean;
  begin
    try
      DmServicos.QEditServico.SQL.Clear;
      DmServicos.QEditServico.SQL.Add('UPDATE servico_ordem_servico');
      DmServicos.QEditServico.SQL.Add('SET quantidade = :quantidade,');
      DmServicos.QEditServico.SQL.Add('valor_unitario = :vlrunit,');
      DmServicos.QEditServico.SQL.Add('valor_total = :vlrtotal');
      DmServicos.QEditServico.SQL.Add('where id_servico_ordem_servico = :id_servico_ordem');
      DmServicos.QEditServico.ParamByName('quantidade').AsInteger := StrToInt(FrmOrdemServicos.EdtQuantidadeServico.Text);
      DmServicos.QEditServico.ParamByName('vlrunit').AsFloat := StrToFloat(FrmOrdemServicos.EdtVlrUnitServicos.Text);
      DmServicos.QEditServico.ParamByName('vlrtotal').AsFloat := StrToFloat(FrmOrdemServicos.EdtVlrTotalServico.Text);
      DmServicos.QEditServico.ParamByName('id_servico_ordem').AsInteger :=  id_servico_ordem;
      DmServicos.QEditServico.ExecSQL;
      FrmOrdemServicos.edicao_servico := 0;
      FrmOrdemServicos.EdtCodServico.Enabled := True;
    except
      result := false;
    end;
  end;

function excluirServico(id_servico_ordem:integer):Boolean;
  begin
      try
         DmServicos.QEditServico.SQL.Clear;
         DmServicos.QEditServico.SQL.Add('DELETE servico_ordem_servico');
         DmServicos.QEditServico.SQL.Add('where id_servico_ordem_servico = :id_servico_ordem');
         DmServicos.QEditServico.ParamByName('id_servico_ordem').AsInteger :=  id_servico_ordem;
         DmServicos.QEditServico.ExecSQL;

      except
          result := false;
        end;
  end;


//Produtos


function editarProduto(id_item_ordem:integer):Boolean;
  begin
    try
      Dmprodutos.QeditProduto.SQL.Clear;
      Dmprodutos.QeditProduto.SQL.Add('UPDATE item_ordem_servico');
      Dmprodutos.QeditProduto.SQL.Add('SET quantidade = :quantidade,');
      Dmprodutos.QeditProduto.SQL.Add('valor_unitario = :vlrunit,');
      Dmprodutos.QeditProduto.SQL.Add('valor_total = :vlrtotal');
      Dmprodutos.QeditProduto.SQL.Add('where id_item_ordem_servico = :id_item_ordem');
      Dmprodutos.QeditProduto.ParamByName('quantidade').AsInteger := StrToInt(FrmOrdemServicos.edtQuantidadeProduto.Text);
      Dmprodutos.QeditProduto.ParamByName('vlrunit').AsFloat := StrToFloat(FrmOrdemServicos.EdtVlrProdutoUnitario.Text);
      Dmprodutos.QeditProduto.ParamByName('vlrtotal').AsFloat := StrToFloat(FrmOrdemServicos.EdtVlrProdutoTotal.Text);
      Dmprodutos.QeditProduto.ParamByName('id_item_ordem').AsInteger :=  id_item_ordem;
      Dmprodutos.QeditProduto.ExecSQL;
      FrmOrdemServicos.edicao_produto := 0;
      FrmOrdemServicos.EdtCodigoProduto.Enabled := True;
    except
      result := false;
    end;
  end;

function excluirProduto(id_item_ordem:integer):Boolean;
  begin
      try
         DmServicos.QEditServico.SQL.Clear;
         DmServicos.QEditServico.SQL.Add('DELETE item_ordem_servico');
         DmServicos.QEditServico.SQL.Add('where id_item_ordem_servico = :id_item_ordem');
         DmServicos.QEditServico.ParamByName('id_item_ordem').AsInteger :=  id_item_ordem;
         DmServicos.QEditServico.ExecSQL;
      except
          result := false;
        end;
  end;

function atualizarOrdemServico(idOrdemServico:integer):Boolean;
  begin
    try
        DmOrdemServicos.QAtualizaOrdem.SQL.Clear;
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('UPDATE ORDEM_SERVICO');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('set observacao = :observacao');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('where id_ordem_servico = :id_ordem');
        DmOrdemServicos.QAtualizaOrdem.ParamByName('observacao').AsString := FrmOrdemServicos.mmoObservacoes.Text;
        DmOrdemServicos.QAtualizaOrdem.ParamByName('id_ordem').AsInteger := idOrdemServico;
        DmOrdemServicos.QAtualizaOrdem.ExecSQL;
    except
      Result := False;

    end;
  end;
function detalhes(id_ordem,situacao,filial:integer):Boolean;
  begin
    try
        DmOrdemServicos.QAtualizaOrdem.SQL.Clear;
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('UPDATE ORDEM_SERVICO');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('set situacao = :situacao,');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('controle_interno = :controle,');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('id_filial = :id_filial');
        DmOrdemServicos.QAtualizaOrdem.SQL.Add('where id_ordem_servico = :id_ordem');
        DmOrdemServicos.QAtualizaOrdem.ParamByName('situacao').AsInteger := situacao;
        DmOrdemServicos.QAtualizaOrdem.ParamByName('controle').AsString := FrmDetalhe.EdtOrdem.Text;
        DmOrdemServicos.QAtualizaOrdem.ParamByName('id_filial').AsInteger := filial;
        DmOrdemServicos.QAtualizaOrdem.ParamByName('id_ordem').AsInteger := id_ordem;
        DmOrdemServicos.QAtualizaOrdem.ExecSQL;
    except
      Result := False;

    end;
  end;

  function cancelar_ordem(id_ordem:integer):Boolean;
    begin
      try
        DmConsultaOrdem.Query.SQL.Clear;
        DmConsultaOrdem.Query.SQL.Add('update ordem_servico');
        DmConsultaOrdem.Query.SQL.Add('set situacao = 1,');
        DmConsultaOrdem.Query.SQL.Add('id_usuario_cancelamento = :id_usuario,');
        DmConsultaOrdem.Query.SQL.Add('data_hora_cancelamento = :hora_cancelamento');
        DmConsultaOrdem.Query.SQL.Add('where id_ordem_servico = :id_ordem');
        DmConsultaOrdem.Query.ParamByName('id_ordem').AsInteger := id_ordem;
        DmConsultaOrdem.Query.ParamByName('id_usuario').AsInteger := TUserSession.GetInstance.UserID;
        DmConsultaOrdem.Query.ParamByName('hora_cancelamento').AsDateTime := Now;
        DmConsultaOrdem.Query.ExecSQL;
        Result := True;
      finally
        Result := False;
      end;
    end;


  function estornar_ordem(id_ordem:integer):Boolean;
    begin
      try
        DmConsultaOrdem.Query.SQL.Clear;
        DmConsultaOrdem.Query.SQL.Add('update ordem_servico');
        DmConsultaOrdem.Query.SQL.Add('set situacao = 0,');
        DmConsultaOrdem.Query.SQL.Add('id_usuario_alteracao = :id_usuario,');
        DmConsultaOrdem.Query.SQL.Add('data_hora_alteracao = :hora_alteracao');
        DmConsultaOrdem.Query.SQL.Add('where id_ordem_servico = :id_ordem');
        DmConsultaOrdem.Query.ParamByName('id_ordem').AsInteger := id_ordem;
        DmConsultaOrdem.Query.ParamByName('id_usuario').AsInteger := TUserSession.GetInstance.UserID;
        DmConsultaOrdem.Query.ParamByName('hora_alteracao').AsDateTime := Now;
        DmConsultaOrdem.Query.ExecSQL;
        Result := True;
      finally
        Result := False;
      end;
    end;



function  PegaTempDir : String;//Pega o diretorio da Pasta Temporaria
var DiretorioTemp : PChar;
    TempBuffer    : Dword;
begin
  TempBuffer := 255;
  GetMem(DiretorioTemp,255);
  try
    GetTempPath(tempbuffer,diretoriotemp);
    result := DiretorioTemp;
  finally
    FreeMem(diretoriotemp);
  end;
end;

end.

object DmSenha: TDmSenha
  OldCreateOrder = False
  Height = 87
  Width = 85
  object qLogin: TFDQuery
    Connection = DmPrincipal.connPrincipal
    SQL.Strings = (
      'Select * from usuario t1'
      
        'where t1.login = :usuario and senha = CONVERT(VARCHAR(32), HashB' +
        'ytes('#39'MD5'#39', :senha), 2) ')
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = 'USUARIO'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
  end
end

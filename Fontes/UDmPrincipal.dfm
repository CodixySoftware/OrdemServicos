object DmPrincipal: TDmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 268
  Width = 222
  object connPrincipal: TFDConnection
    Params.Strings = (
      'Database=Hiper'
      'User_Name=sa'
      'Password=codixy'
      'Server=.\codixy'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server Native Client 11.0'
    Left = 88
    Top = 168
  end
end

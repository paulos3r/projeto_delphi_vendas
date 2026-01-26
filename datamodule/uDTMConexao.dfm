object dtmConexao: TdtmConexao
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database=VENDAS'
      'Password=DADOS'
      'Server=localhost'
      'User_Name=postgres')
    Connected = True
    Left = 70
    Top = 210
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 310
    Top = 300
  end
end

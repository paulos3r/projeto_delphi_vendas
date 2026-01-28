object dtmConexao: TdtmConexao
  Height = 480
  Width = 640
  object conOracle: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 1521
    Database = '//localhost:1521/XEPDB1'
    User = 'VENDAS'
    Password = 'vendas'
    Protocol = 'oracle'
    LibraryLocation = 'C:\oracle\instantclient_21_20\oci.dll'
    Left = 128
    Top = 184
  end
end

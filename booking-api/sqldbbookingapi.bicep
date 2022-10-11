param serverName string = 'adkwoleksql'
param sqlDBName string = 'adkwolekDB'
param location string = resourceGroup().location
param administratorLogin string = 'admminuser'
@secure()
param administratorLoginPassword string = 'Qwerty12!'

resource sqlServer 'Microsoft.Sql/servers@2021-08-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2021-08-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource firewall 'Microsoft.Sql/servers/firewallRules@2022-02-01-preview' = {
  name: 'Iprule'
  parent: sqlServer
  properties: {
    endIpAddress: '255.255.255.255'
    startIpAddress: '0.0.0.0'
  }
}


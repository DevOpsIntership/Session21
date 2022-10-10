param appservice string = 'adkwolekAppservienging'
param webSiteName string = 'adkwoleknginx'
param sku string = 'B1'
param linuxFxVersion string = 'DOCKER|nginx'
param location string = resourceGroup().location  
param  numberOfWorkers int = 1
param tier string = 'Basic'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appservice
  location: location
  properties: {
    reserved: true
    
  }
  sku: {
    name: sku
    tier: tier
  }
  kind: 'linux'
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
      numberOfWorkers:numberOfWorkers

    }
    httpsOnly:false
  }
}

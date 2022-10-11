param appservice string = 'adkwolekbookingapi'
param webSiteName string = 'webadkwolekbookingapi'
param sku string = 'B1'
param linuxFxVersion string = 'DOCKER|adamkwolek/bookingapi'
param location string = resourceGroup().location  
param  numberOfWorkers int = 2
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
      appSettings:[
        {
          name:'sqldb'
          value:'Data Source=adkwolekbookingapiserv.database.windows.net;Initial Catalog=bookingAPIdb;Integrated Security=False;User Id=adminusername;Password=Qwerty12!;MultipleActiveResultSets=True;'
        }
      ]

    }
    httpsOnly:false
  }
}


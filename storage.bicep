param location string = resourceGroup().location
param stgName string

resource storageAccount_res 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: stgName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    publicNetworkAccess: 'Enabled'
  }
}

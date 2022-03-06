

@description('Podaj nazwę konta storage')
@minLength(3)
@maxLength(23)
param stgName string

param location string = resourceGroup().location

var StorageName = toLower((stgName))

resource storageAccount_res 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: StorageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
  }
}


output storageName string = storageAccount_res.name
output storageAccountId string = storageAccount_res.id

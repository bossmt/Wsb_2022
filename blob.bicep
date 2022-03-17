param blobNames array = [
  'log'
  'picture'
  'text'
]
param sa object

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-06-01' = [for name in blobNames: {
  //name: '${name}${uniqueString(resourceGroup().id)
  name: '${sa}/default/${name}'
}]

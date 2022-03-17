@description('Podaj nazwę konta storage')
@minLength(3)
@maxLength(23)
param stgName string

param location string = resourceGroup().location
var storageName = toLower((stgName))

module storage 'storage.bicep' = {
  name:'storageDeploy'
  params: { 
    location: location
    stgName: storageName
  }
}

module blob 'blob.bicep' = {
  name:'blobDeploy'
  params:{
    sa: storage
  }
}

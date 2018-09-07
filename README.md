
# Deploy an example Nodejs app on Linux  App Service in Azure


## Setting Started
Example of creating and deploying a nodejs app to Azure Linux App Service, this will cover using the App Service Built in docker images, or creating your own. 

* For a `Custom Image`, to use any runtime you wish, we will use a Azure private Registry to upload our custom images, then deploy to App Service with this options:
    * _Continous Integration_: Supported via webhook with DockerHub, or Azure Contain Registry
    * _Compose  or Kubernetes files_: deploy multi-container services
    * _az cli_: 

    * NOTE: set 
* For the `Built in Image`, (node,java,ruby,dotnet) we can use any one of the App Services deployment methods to deploy our app to the app service storage, then the selected Built In image with the language runtime is deployed and connects to the storage and runs the app. Deployment methods include:
    * _Kudu (Local Git, or github/bitbucket):_ this will also use built in scripts to build your source code.
    * _FTP,ZIP:_  We will use "ZIP deploy" method to release code

    * NOTE: have your code listen on process.env.PORT, to be exposed to the webapp URL

### Environment Setup

We are using a linux based PC environment for the local developer enviroment (this can be Bash On Windows, Mac, or a Linux distro). Install the following azure cross-platform CLI tools to install:

* `az cli` (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest) 
* `Docker` NOTEL: if using WSL, install Docker CE on windows 10 and configure to expose on tcp port, then install docker for ubuntu.
* `zip` for ZIP deploy


### Create Azure Services

1. run `az login` to login to your Azure subscription

2. run the script `$ ./cloud_services.azcli` to create the require components to deploy your continer application, this creates:
    * a private container registry
    * a linux App Service PaaS environment

NOTE: Take a note of the registry name that was created for the next step

## The 'Built in Image' approach



## The Custom Container Approach



### Build your container

Create your image locally, and tag it with a label

```
docker build -t kh-azlinuxcontainer  .

az acr login -n <registry name>

docker tag <registry name>.azurecr.io/kh-azlinuxcontainer:latest

docker push <registry name>.azurecr.io/kh-azlinuxcontainer:latest
```
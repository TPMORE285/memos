# Azure Container Apps + Front Door Deployment Documentation

## Local Setup
To set up your local environment for Azure Container Apps and Front Door, follow these steps:

1. Install the Azure CLI:
   ```bash
   az upgrade
   ```

2. Install Docker Desktop:
   - Follow the instructions from [Docker Hub](https://hub.docker.com/?overlay=onboarding).

3. Authenticate with Azure:
   ```bash
   az login
   ```

## Environment Variables
Set the following environment variables for your application:
- `AZURE_SUBSCRIPTION_ID`: Your Azure subscription ID.
- `RESOURCE_GROUP`: The name of your resource group.
- `CONTAINER_APP_NAME`: The name of your Azure Container App.
- `FRONT_DOOR_NAME`: The name of your Azure Front Door instance.

## Deployment Steps
1. **Create a Resource Group:**
   ```bash
   az group create --name $RESOURCE_GROUP --location <location>
   ```

2. **Deploy the Container App:**
   ```bash
   az containerapp create --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP --image <your-docker-image> --environment <environment-name>
   ```

3. **Set Up Front Door:**
   ```bash
   az resource create --resource-group $RESOURCE_GROUP --resource-type Microsoft.Network/frontDoors --name $FRONT_DOOR_NAME --properties <properties>
   ```

## CI/CD Configuration
To configure CI/CD for your Azure Container Apps, use GitHub Actions:
1. Create a workflow file in `.github/workflows/deploy.yml`:
   ```yaml
   name: Deploy to Azure
   on:
     push:
       branches:
         - main
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
         - name: Set up Docker Buildx
           uses: docker/setup-buildx-action@v1
         - name: Build and Push
           uses: docker/build-push-action@v2
           with:
             context: .
             dockerfile: Dockerfile
   ```

## Monitoring
Utilize Azure Application Insights for monitoring the performance of your applications. Set it up in the Azure portal and integrate it with your Azure Container App.

## Troubleshooting Guidance
- If containers fail to start, check the logs:
  ```bash
  az containerapp logs show --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP
  ```
- For deployment issues, review the status of the resource group and deployed resources in the Azure portal.

### Additional Resources
- [Azure Container Apps Documentation](https://learn.microsoft.com/en-us/azure/container-apps/)
- [Azure Front Door Documentation](https://learn.microsoft.com/en-us/azure/frontdoor/frontdoor-overview/)
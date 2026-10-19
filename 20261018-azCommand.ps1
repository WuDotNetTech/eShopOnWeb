az login

# Deploy Azure App Service web apps to two Azure regions

# Set your preferred primary region (e.g., eastus, westeurope, australiaeast)
$PRIMARY_REGION="centralus"
$PRIMARY_REGION_SUFFIX="centralus"

# Create resource group for primary region
az group create --name rg-eshoponweb-$PRIMARY_REGION_SUFFIX --location $PRIMARY_REGION

# Generate unique suffix for webapp name
$SUFFIX = [System.Guid]::NewGuid().ToString("N").Substring(0, 8)

# Deploy the Bicep template for primary region
az deployment group create `
  --resource-group rg-eshoponweb-$PRIMARY_REGION_SUFFIX `
  --template-file infra/webapp.bicep `
  --parameters webAppName=eshop-$PRIMARY_REGION_SUFFIX-$SUFFIX `
    sku=F1 `


# Set your preferred secondary region (e.g., westus, northeurope, southeastasia)
$SECONDARY_REGION="eastus"
$SECONDARY_REGION_SUFFIX="eastus"

# Create resource group for secondary region
az group create --name rg-eshoponweb-$SECONDARY_REGION_SUFFIX --location $SECONDARY_REGION

# Deploy the Bicep template for secondary region
az deployment group create `
  --resource-group rg-eshoponweb-$SECONDARY_REGION_SUFFIX `
  --template-file infra/webapp.bicep `
  --parameters webAppName=eshop-$SECONDARY_REGION_SUFFIX-$SUFFIX `
  sku=F1 `

# az ad sp create-for-rbac --name "devopsfoundationslabsp" --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID --json-auth


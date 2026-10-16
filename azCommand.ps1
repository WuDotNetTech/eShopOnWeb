az login

az group create --name "rg-eshoponweb-region1" --location "eastus"
az group create --name "rg-eshoponweb-region2" --location "centralus"

$REGION1="eastus"
$REGION2="centralus"
echo "REGION1=$REGION1"
echo "REGION2=$REGION2"

$SUBSCRIPTION_ID=$(az account show --query id --output tsv)
echo $SUBSCRIPTION_ID

az ad sp create-for-rbac --name "devopsfoundationslabsp" --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID --json-auth

echo devops-webapp-$REGION1-$((Get-Random -Maximum 99999))
echo devops-webapp-$REGION2-$((Get-Random -Maximum 99999))
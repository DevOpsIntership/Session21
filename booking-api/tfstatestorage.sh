#!/bin/bash



az storage account create --resource-group "automation" --name "adkwolektfstste" --sku Standard_LRS --encryption-services blob

az storage container create --name "container" --account-name "adkwolektfstste"

ACCOUNT_KEY=$(az storage account keys list --resource-group "automation" --account-name "adkwolektfstste" --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY
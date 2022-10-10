terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

backend "azurerm" {
    resource_group_name  = "automation"
    storage_account_name = "adkwolektfstste"
    container_name       = "container"
    key                  = "terraform.tfstate"
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "test" {
  name     = "test"
  location = "West Europe"
}
terraform {
  required_version = ">1.3.7"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.43.0"
    }
  }

    cloud {    
        organization = "adrianrogalski" 
        workspaces { 
            name = "TerraformCI" 
    } 
  } 
} 

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name = "ar-resource-group"
  location = "Central US"
}

resource "azurerm_storage_account" "storage" {
  name = "arstrg101"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "RAGRS"
}
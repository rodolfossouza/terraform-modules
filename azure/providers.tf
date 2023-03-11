terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.41.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  required_version = ">=1.3.7"
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id 
    tenant_id = var.tenant_id
  # Configuration options
}
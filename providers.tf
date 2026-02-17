terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # This block keeps your local environment in sync with Azure and GitHub
  backend "azurerm" {
    resource_group_name   = "rg-jetops-terraform-state"
    storage_account_name  = "stjetopsstate001"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "57600a79-c6d9-4b38-986a-a7ade5669711"
}
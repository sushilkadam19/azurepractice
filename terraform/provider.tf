terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}

terraform {
 backend "azurerm" {
  resource_group_name = "RG-CI-Storage"
  storage_account_name = "cistatestorage"
  container_name = "githubstate"
  key = "githubstate.tfstate"
 }
}

provider "azurerm" {
  # Configuration options
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}

terraform {
 backend "azurerm" {}
}

provider "azurerm" {
  # Configuration options
  features {}
  skip_provider_registration = true
}
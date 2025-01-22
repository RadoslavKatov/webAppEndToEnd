terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.16.0"  # Use a compatible version
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "3eb290da-4314-4308-b939-94f412511965"
  client_id       = "920d6c34-7145-4857-82e6-234bc2755935"
  client_secret   = "T4W8Q~-thEV-BW3ZnwqqvBd4is3m_A0UO9DyYbfS"
  tenant_id       = "deddc320-f4ac-400c-aa71-c1e3bcdcd430"
}
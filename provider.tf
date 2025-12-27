terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  subscription_id = "52cd5f2c-0d28-4429-b80d-950089f20b98"
}

provider "vault" {
  address = "http://vault-internal.anilcloudengineer.online:8200"
  token = var.token
}


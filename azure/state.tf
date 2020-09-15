terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend"
    storage_account_name = "terraformeun"
    container_name       = "tfsstate"
    key                  = "prod.terraform.tfstate"
  }
}
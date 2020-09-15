resource "azurerm_virtual_network" "network" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
  depends_on          = [var.depends-on]
}
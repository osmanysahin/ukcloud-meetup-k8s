resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.subnet_address_prefix]
  virtual_network_name = var.virtual_network_name
  depends_on           = [var.depends-on]
}
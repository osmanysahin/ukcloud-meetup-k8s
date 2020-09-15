resource "azurerm_log_analytics_workspace" "laws" {
  # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
  name                = var.log_analytics_workspace_name
  location            = var.log_analytics_workspace_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  depends_on          = [var.depends-on]
}
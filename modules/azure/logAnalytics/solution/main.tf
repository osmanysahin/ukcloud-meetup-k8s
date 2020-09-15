resource "azurerm_log_analytics_solution" "log_alaytics_solution" {
  solution_name         = "ContainerInsights"
  location              = var.log_analytics_workspace_location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = var.log_analytics_workspace_id
  workspace_name        = var.log_analytics_workspace_name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
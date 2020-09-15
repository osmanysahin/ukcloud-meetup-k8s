resource "azurerm_kubernetes_cluster" "cluster" {
  name       = var.cluster_name
  location   = var.location
  dns_prefix = var.resource_prefix
  depends_on = [var.depends-on]

  resource_group_name = var.resource_group_name

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.agent_count
    vm_size             = var.vm_size
    enable_auto_scaling = var.enable_auto_scale
    max_count           = var.max_node_count
    min_count           = var.min_node_count
    vnet_subnet_id      = var.subnet_id
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  addon_profile {
    kube_dashboard {
      enabled = var.dashboard_enabled
    }
    oms_agent {
      enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  role_based_access_control {
    enabled = var.role_based_access_control_enabled
  }

  tags = var.tags
}

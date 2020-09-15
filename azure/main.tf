
module "rg" {
  source              = "../modules/azure/resourceGroup"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  tags                = var.tags
}

module "vnet" {
  source              = "../modules/azure/network/vnet"
  vnet_name           = var.vnet_name
  resource_group_name = module.rg.name
  vnet_address_space  = var.vnet_address_space
  location            = module.rg.location
  tags                = var.tags
  depends-on          = [module.rg]
}

module "subnet" {
  source                = "../modules/azure/network/subnet"
  subnet_name           = var.subnet_name
  resource_group_name   = module.rg.name
  subnet_address_prefix = var.subnet_address_prefix
  virtual_network_name  = module.vnet.vnet_name
  depends-on            = [module.vnet]

}

resource "random_id" "random" {
  byte_length = 8
}

module "log_analytics_workspace" {
  source                           = "../modules/azure/logAnalytics/workspace"
  log_analytics_workspace_name     = "${var.log_analytics_workspace_name}-${random_id.random.dec}"
  log_analytics_workspace_location = var.log_analytics_workspace_location
  resource_group_name              = module.rg.name
  log_analytics_workspace_sku      = var.log_analytics_workspace_sku
  depends-on                       = [module.rg]


}

module "log_analytics_solution" {
  source                           = "../modules/azure/logAnalytics/solution"
  log_analytics_workspace_location = module.log_analytics_workspace.location
  resource_group_name              = module.rg.name
  log_analytics_workspace_id       = module.log_analytics_workspace.id
  log_analytics_workspace_name     = module.log_analytics_workspace.name
}


module "aks" {
  source                            = "../modules/azure/aks"
  cluster_name                      = var.cluster_name
  location                          = module.rg.location
  resource_prefix                   = var.resource_prefix
  depends-on                        = [module.subnet]
  resource_group_name               = module.rg.name
  node_pool_name                    = var.node_pool_name
  agent_count                       = var.agent_count
  vm_size                           = var.vm_size
  enable_auto_scale                 = var.enable_auto_scale
  max_node_count                    = var.max_node_count
  min_node_count                    = var.min_node_count
  subnet_id                         = module.subnet.id
  service_principal_client_id       = var.client_id
  service_principal_client_secret   = data.azurerm_key_vault_secret.secret.value
  network_plugin                    = var.network_plugin
  dashboard_enabled                 = var.dashboard_enabled
  oms_agent_enabled                 = var.oms_agent_enabled
  log_analytics_workspace_id        = module.log_analytics_workspace.id
  role_based_access_control_enabled = var.rbac_enabled
  tags                              = var.tags
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.keyvault_rg
}

data "azurerm_key_vault_secret" "secret" {
  name         = var.keyvault_secret
  key_vault_id = data.azurerm_key_vault.keyvault.id
}



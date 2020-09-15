resource_group_name              = "aks-rg-eun"
resource_group_location          = "northeurope"
resource_prefix                  = "k8seun"
cluster_name                     = "k8s-aks-eun"
vnet_name                        = "k8s-vnet-eun"
subnet_name                      = "k8s-sn-eun"
node_pool_name                   = "k8snodeeun"
vm_size                          = "Standard_D2s_v3"
vnet_address_space               = "10.1.0.0/16"
subnet_address_prefix            = "10.1.0.0/24"
agent_count                      = "2"
log_analytics_workspace_name     = "k8sLogAWS"
log_analytics_workspace_location = "eastus"
log_analytics_workspace_sku      = "PerGB2018"
enable_auto_scale                = true
max_node_count                   = 5
min_node_count                   = 1
network_plugin                   = "azure"
dashboard_enabled                = true
oms_agent_enabled                = true
rbac_enabled                     = true





#keyvault secrets for service principal
keyvault_rg     = "k8s-kv-eun"
keyvault_name   = "k8s-kv-eun"
keyvault_secret = "k8s-secret"
client_id       = "8c4524b8-d116-42bd-930f-7f115d6a771d"
#tags
tags = {
  createdBy   = "Osman SAHIN"
  environment = "dev"
}






output "host" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.host}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config_raw}"
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate}"
}

output "client_key" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate}"
}

output "cluster_username" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.username}"
}

output "cluster_password" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.password}"
}
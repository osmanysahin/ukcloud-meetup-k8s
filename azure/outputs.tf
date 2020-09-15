output "reourcegroup_id" {
  value = "${module.rg.rg_id}"
}


############

output "host" {
  value = "${module.aks.host}"
}

output "kube_config" {
  value = "${module.aks.kube_config}"
}

output "client_certificate" {
  value = "${module.aks.client_certificate}"
}

output "keyvault_id" {
  value = "${data.azurerm_key_vault.keyvault.id}"
}

output "value" {
  value = "${data.azurerm_key_vault_secret.secret.value}"
}


output "client_key" {
  value = "${module.aks.client_key}"
}

output "cluster_ca_certificate" {
  value = "${module.aks.cluster_ca_certificate}"
}

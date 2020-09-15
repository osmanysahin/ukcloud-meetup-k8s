variable "region" {
  description = "Region of resources"
}

variable "vpc_name" {
  description = "Network name"
}

variable "subnet_cidr" {
  description = "Subnet range"
}

variable "gke_firewall_ext_name" {
  description = "external firewall key name"
}

variable "gke_firewall_int_name" {
  description = "internal firewall key name"
}

variable "gke_subnet_name" {
  description = "subnet name"
}

variable "auto_create_subnetwork" {
  description = "auto crete subnetworks on creation"
}

# GKE variables

variable "gke_cluster_name" {
  description = "GKE kubernetes cluster name"
}

variable "min_master_version" {
  description = "Number of nodes in each GKE cluster zone"
}

variable "node_version" {
  description = "Number of nodes in each GKE cluster zone"
}

variable "gke_num_nodes" {
  description = "Number of nodes in each GKE cluster zone"
}


variable "gke_master_user" {
  description = "Username to authenticate with the k8s master"
}

variable "gke_master_pass" {
  description = "Username to authenticate with the k8s master"
}

variable "gke_node_machine_type" {
  description = "Machine type of GKE nodes"
}

# k8s variables
variable gke_label {
  description = "label"
}


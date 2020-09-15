module "gke" {
  source = "../modules/gcp"
  //network
  region                 = var.region
  vpc_name               = var.vpc_name
  gke_subnet_name        = var.subnet_name
  auto_create_subnetwork = var.auto_create_subnetwork
  subnet_cidr            = var.subnet_cidr
  gke_firewall_int_name  = var.int_firewall_name
  gke_firewall_ext_name  = var.ext_firewall_name
  //gke
  gke_cluster_name      = var.cluster_name
  min_master_version    = var.min_master_version
  node_version          = var.node_version
  gke_num_nodes         = var.gke_num_nodes
  gke_master_user       = var.gke_master_user
  gke_master_pass       = var.gke_master_pass
  gke_node_machine_type = var.gke_node_machine_type
  gke_label             = var.gke_label
}

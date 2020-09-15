
# GKE outputs
output "endpoint" {
  value       = module.gke.endpoint
  description = "Endpoint for accessing the master node"
}
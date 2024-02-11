
output "cluster_name" {
    value = google_container_cluster.primary.name
  
}
output "cluster_prim_location" {
    value = google_container_cluster.primary.location
  
}
output "network_name" {
   value = google_compute_network.main-1.name
  
}
output "kubernetes_endpoint" {
    value = google_container_cluster.primary.endpoint
}
output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = google_service_account.service-a.name
}
output "subnet_names" {
  description = "The names of the subnet being created"
  value       = google_compute_subnetwork.private.name
}

output "node_location" {
    value = google_container_cluster.primary.node_locations
  
}

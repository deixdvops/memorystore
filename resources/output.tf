output "redis_instance_id" {
  description = "The redis cluster instance ID"
  value       = module.memorystore-redis-cluster.redis_instance_id
}

output "discovery_endpoints" {
  description = "Endpoints created on each given network, for Redis clients to connect to the cluster. Currently only one endpoint is supported"
  value       = module.memorystore-redis-cluster.discovery_endpoints
}

output "psc_connections" {
  description = "PSC connections for discovery of the cluster topology and accessing the cluster"
  value       = module.memorystore-redis-cluster.psc_connections
}

output "redis_cluster" {
  description = "The redis cluster created"
  value       = module.memorystore-redis-cluster.redis_cluster
}

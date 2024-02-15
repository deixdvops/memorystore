output "project_id" {
  description = "The redis cluster Project ID"
  value       = local.project_id
}

output "cluster_region" {
  description = "The redis cluster region"
  value       = local.region
}

# output "redis_cluster_id" {
#   description = "The ID of the Redis cluster."
#   value       = google_redis_cluster.redis_cluster.id
# }

output "redis_cluster" {
  description = "The redis cluster created"
  value       = module.redis_cluster.redis_cluster
}

output "size_gb" {
  description = "The redis cluster size"
  value       = module.redis_cluster.size_gb
}

output "replica_count" {
  description = "The redis cluster replica count"
  value       = module.redis_cluster.replica_count
}

output "transit_encryption_mode" {
  description = "The redis cluster transit encryption mode"
  value       = module.redis_cluster.transit_encryption_mode
}

output "shard_count" {
  description = "The redis cluster shard count"
  value       = module.redis_cluster.shard_count
}

output "authorization_mode" {
  description = "The redis cluster authorization mode"
  value       = module.redis_cluster.authorization_mode
}
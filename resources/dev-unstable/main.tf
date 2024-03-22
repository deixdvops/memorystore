module "redis_cluster" {
  source = "git@github.com:deixdvops/memorystore.git//resources/test-module"
  
  redis_cluster_name = var.redis_cluster_name
  region             = var.region
  shard_count        = var.shard_count
  replica_count      = var.replica_count
  project_id         = var.project_id
  network_name    = var.network_name
  subnet_names    = var.subnet_names
}

module "redis_cluster" {
  source = "git@github.com:deixdvops/memorystore.git//resources/test-module"

  redis_cluster_name = local.redis_cluster_name
  region             = local.region
  shard_count        = local.shard_count
  replica_count      = local.replica_count
  project_id         = local.project_id
  network_name       = local.network_name
  subnet_names       = local.subnet_names
  enable_apis = false
}

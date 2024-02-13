module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 8.0"

  name    = local.name
  project = local.project
  region  = local.region
  shard_count   = local.shard_count
  replica_count = local.replica_count
  
  
  network = ["projects/${local.project}/global/networks/${local.network_name}"]

  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = local.project
      subnet_names = [
        "private",
        
      ]
    }
  }
}
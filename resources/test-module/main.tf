module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 8.0"

  name    = var.redis_cluster_name
  project = var.project_id
  region  = var.region
  shard_count   = var.shard_count
  replica_count = var.replica_count
  enable_apis = var.enable_apis

  
  
  network = ["projects/${var.project_id}/global/networks/${var.network_name}"]

  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = var.network_name
      network_project = var.project_id
      subnet_names = var.subnet_names
        
    }
  }
}

module "qa_redis_cluster" {
  source  = "../modules/memorystore-redis-cluster"
  project                 = "deix-devops"
  name                    = "qa-redis-test"
  shard_count             = 3
  region                  = "us-central1"
  replica_count           = 1
  
  network = ["projects/${var.project_id}/global/networks/${local.network_name}"]

  service_connection_policies = {
    qa-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = local.subnet_names
    
    }
  }
 
}


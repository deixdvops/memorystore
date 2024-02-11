module "redis_cluster" {
  source = "../../modules/memorystore-redis-cluster"

  name          = var.name
  project       = var.project_id
  region        = var.region
  shard_count   = 5
  replica_count = 2
  connect_mode  = "PRIVATE_SERVICE_ACCESS"


  network = ["projects/${var.project_id}/global/networks/${local.network_name}"]

  service_connection_policies = {
    qa_redis_cluster-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names    = local.subnet_names

    }
  }

}
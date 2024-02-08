module "redis_cluster" {
  source  = "../../modules/memorystore-redis-cluster"

  name    = var.name
  project = var.project_id
  region  = var.region
  network = ["projects/${var.project_id}/global/networks/${local.network_name}"]

  service_connection_policies = {
    dev-redis-cluster-scp = {
      network_name    = local.network_name
      network_project = var.project_id
      subnet_names = local.subnet_names
    
    }
  }

}
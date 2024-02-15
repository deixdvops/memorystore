locals {
  redis_cluster_name = "redis-cluster-name"
  region             = "us-central1"
  shard_count        = 3
  replica_count      = 1
  project_id         = "deix-devops"
  network_name       = "main-1"
  subnet_names       = ["private"]
}
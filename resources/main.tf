module "memorystore-redis-cluster" {
  source  = "../modules/memorystore-redis-cluster"
  project                 = "deix-devops"
  name                    = "sand-redis-test"
  shard_count             = 3
  region                  = "us-central1"
  replica_count           = 1
 
}


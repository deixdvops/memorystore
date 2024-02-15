variable "redis_cluster_name" {
  type = string
}

variable "region" {
  type = string
}

variable "shard_count" {
  type = number
}

variable "replica_count" {
  type = number
}

variable "project_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_names" {
  type = list(string)
}

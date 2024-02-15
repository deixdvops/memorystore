variable "project_id" {
  description = "Google cloud project id to create redis cluster."
  type        = string
  default     = "deix-devops"
}
variable "region" {
  type    = string
  default = "us-central1"

}
variable "redis_cluster_name" {
  type    = string
  description = "The name of the redis cluster you are creating"
  default = "test2-redis-cluster"

}
variable "shard_count" {
    type = number
    description = "The redis cluster shard count"
  
}
variable "replica_count" {
    type = number
    description = "The redis cluster replica count"
    default = 1
  
}

variable "network_name" {
    type = string
    description = "The name of the network"
  
}
variable "subnet_names" {
    type = list(string)
  
}

variable "authorization_mode" {
    type = string
    description = "valueThe authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is AUTH_MODE_DISABLED. Possible values are: AUTH_MODE_UNSPECIFIED, AUTH_MODE_IAM_AUTH, AUTH_MODE_DISABLED"
    default = "AUTH_MODE_DISABLED"
  
}

variable "transit_encryption_mode" {
    type = string
    description = "The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is TRANSIT_ENCRYPTION_MODE_DISABLED. Possible values are: TRANSIT_ENCRYPTION_MODE_UNSPECIFIED, TRANSIT_ENCRYPTION_MODE_DISABLED, TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION"
    default = "TRANSIT_ENCRYPTION_MODE_DISABLED"
  
}
variable "enable_apis" {
  description = "Flag for enabling memcache.googleapis.com in your project"
  type        = bool
  default     = false
}
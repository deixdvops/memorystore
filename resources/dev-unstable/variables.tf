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
variable "authorization_mode" {
  description = "The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is AUTH_MODE_DISABLED. Possible values are: AUTH_MODE_UNSPECIFIED, AUTH_MODE_IAM_AUTH, AUTH_MODE_DISABLED"
  type        = string
  default     = "AUTH_MODE_IAM_AUTH"
}

variable "project_id" {
  description = "Google cloud project id to create redis cluster."
  type        = string
  default     = "deix-devops"
}
variable "region" {
  type    = string
  default = "us-central1"

}
variable "name" {
  type    = string
  description = "The name of the redis cluster you are creating"
  default = "test2-redis-cluster"

}
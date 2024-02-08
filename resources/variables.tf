variable "project_id" {
  description = "Google cloud project id to create redis cluster."
  type        = string
  default = "deix-devops"
}
variable "region" {
    type = string
    default = "us-central1"
  
}
variable "name" {
    type = string
    default = "test2-redis-cluster"
  
}
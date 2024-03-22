data "terraform_remote_state" "other_config" {
  backend = "local"

  config = {
    path = "/Users/dei/Verily/memorystore/resources/gke-2/terraform.tfstate" # Path to the state file of the other configuration or module
  }
}
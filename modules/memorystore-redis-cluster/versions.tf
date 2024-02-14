terraform {
  required_version = ">= 1.5"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 5.4, < 6"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.4, < 6"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-memorystore:redis-cluster/v8.0.0"
  }

  provider_meta "google-beta" {
    module_name = "blueprints/terraform/terraform-google-memorystore:redis-cluster/v8.0.0"
  }

}
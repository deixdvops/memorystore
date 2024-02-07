resource "google_redis_cluster" "redis_cluster" {
  project                 = var.project
  name                    = var.name
  shard_count             = var.shard_count
  region                  = var.region
  replica_count           = var.replica_count
  transit_encryption_mode = var.transit_encryption_mode
  authorization_mode      = var.authorization_mode

  psc_configs {
# This is for a dynamic config
#     dynamic "psc_configs" {
#     for_each = var.network
#     content {
#       network = psc_configs.value
#     }
#   }
    network = google_compute_network.producer_net.id
  }
  
  depends_on = [
    google_network_connectivity_service_connection_policy.default,
    module.enable_apis,
  ]

}

resource "google_network_connectivity_service_connection_policy" "default" {
  name = "mypolicy"
  project = var.project
  location = "us-central1"
  service_class = "gcp-memorystore-redis"
  description   = "my basic service connection policy"
  network = google_compute_network.producer_net.id
  psc_config {
    subnetworks = [google_compute_subnetwork.producer_subnet.id]
  }
}
#This is for a dynamic config
# resource "google_network_connectivity_service_connection_policy" "service_connection_policies" {
#   for_each      = var.service_connection_policies
#   project       = each.value.network_project
#   name          = each.key
#   location      = var.region
#   service_class = "gcp-memorystore-redis"
#   description   = lookup(each.value, "description", null)
#   network       = "projects/${each.value.network_project}/global/networks/${each.value.network_name}"
#   labels        = each.value.labels

#   psc_config {
#     subnetworks = [for x in each.value.subnet_names : "projects/${each.value.network_project}/regions/${var.region}/subnetworks/${x}"]
#     limit       = lookup(each.value, "limit", null)
#   }

# }

resource "google_compute_subnetwork" "producer_subnet" {
  name          = "mysubnet"
  project = var.project
  ip_cidr_range = "10.0.0.248/29"
  region        = "us-central1"
  network       = google_compute_network.producer_net.id
}

resource "google_compute_network" "producer_net" {
  name                    = "mynetwork"
  project = var.project
  auto_create_subnetworks = false
}

module "enable_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.0"

  project_id  = var.project
  enable_apis = var.enable_apis

  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "redis.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}
provider "google" {
  project = "gatdeix-devops" # Replace with your GCP project ID
  #region  = "your_region"    # Replace with your desired region
}

resource "google_dns_managed_zone" "private" {
  name        = "private-zone"   # Replace with your desired zone name
  dns_name    = "internal.cmba." # Replace with your domain name ending with a period
  description = "Managed private zone for food"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = data.terraform_remote_state.other_config.outputs.network_self_link
    }
  }
}

resource "google_dns_record_set" "redis_dns" {
  name = "redis.${google_dns_managed_zone.private.dns_name}"
  type = "A"
  ttl  = 300 # Adjust TTL as needed

  managed_zone = google_dns_managed_zone.private.name

  rrdatas = [module.redis_cluster.redis_cluster.psc_connections[0].address] # Assuming you want to use the first connection address
}

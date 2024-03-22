provider "google" {
  project = var.project_id # 
}

resource "google_dns_managed_zone" "private" {
  name        = "private-zone"
  dns_name    = "internal.cmb."
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
  ttl  = 300

  managed_zone = google_dns_managed_zone.private.name

  rrdatas = [module.redis_cluster.redis_cluster.psc_connections[0].address] # Assuming you want to use the first connection address
}

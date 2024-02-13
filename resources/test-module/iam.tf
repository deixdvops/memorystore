resource "google_project_service_identity" "network_connectivity_sa" {
  provider = google-beta

  project = local.project
  service = "networkconnectivity.googleapis.com"
}

resource "google_project_iam_member" "network_connectivity_sa" {
  project = local.project
  role    = "roles/networkconnectivity.serviceAgent"
  member  = "serviceAccount:${google_project_service_identity.network_connectivity_sa.email}"
}
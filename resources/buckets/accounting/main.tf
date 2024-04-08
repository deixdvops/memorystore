locals {
  service_account_name = ""

  project_id = ""
  location   = "us-west2"
  bucket_names = {
    "douche"         = "${local.project_id}-douche"
    "douche-payment" = "${local.project_id}-douche-payment"
  }
}


module "storage_buckets" {
  source = "../../../modules/buckets"

  project_id = local.project_id
  location   = local.location
  for_each   = { for bkt, bucket in local.bucket_names : bkt => bucket }
  name       = each.value

}
resource "google_storage_bucket_iam_binding" "bucket_bindings" {
  for_each = module.storage_buckets
  bucket   = each.value.name

  role    = "roles/storage.admin"
  members = ["serviceAccount:${local.service_account_name}@${local.project_id}.iam.gserviceaccount.com"]
}




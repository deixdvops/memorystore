locals {
  project_id = ""
  location   = "us-west2"
  bucket_names = {
    "douche"         = "${local.project_id}-douche"
    "douche-payment" = "${local.project_id}-douche-payment"
  }
}

module "storage_buckets" {
  source     = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version    = "~> 5.0"
  project_id = local.project_id
  for_each   = local.bucket_names
  name       = each.value
  location   = local.location
  iam_members = [{
    role   = "roles/storage.objectCreator"
    member = "serviceAccount:terraform@gatdeix-devops.iam.gserviceaccount.com"
  }]
}
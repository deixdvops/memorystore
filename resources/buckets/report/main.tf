locals {
  project_id  = ""
  location    = "us-west2"
  bucket_name = "${local.project_id}-mboni"


}

module "storage_buckets" {
  source     = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version    = "~> 5.0"
  project_id = local.project_id
  name       = local.bucket_name
  location   = local.location
  iam_members = [{
    role   = "roles/storage.objectCreator"
    member = "serviceAccount:terraform@gatdeix-devops.iam.gserviceaccount.com"
  }]
}
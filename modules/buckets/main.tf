

# module "storage_buckets" {
#   source     = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
#   version    = "~> 5.0"
#   project_id = local.project_id
#   for_each   = local.bucket_names
#   name       = each.value
#   location   = local.location
#   #   iam_members = [{
#   #     role   = "roles/storage.objectCreator"
#   #     member = "serviceAccount:${local.service_account_name}@${local.project_id}.iam.gserviceaccount.com"
#   #   }]
# }

# resource "google_storage_bucket_iam_member" "object_creator" {
#   for_each = module.storage_buckets

#   bucket = each.value.name
#   role   = "roles/storage.objectCreator"
#   member = "serviceAccount:${local.service_account_name}@${local.project_id}.iam.gserviceaccount.com"
# }


resource "google_storage_bucket" "bucket" {
  name                        = var.name
  project                     = var.project_id
  location                    = var.location
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.bucket_policy_only
}





resource "google_storage_bucket" "bucket" {
  for_each = {
    for bucket in var.buckets : bucket.name => bucket
  }

  project                     = var.project_id
  name                        = each.value.name
  location                    = each.value.location
  force_destroy               = false
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

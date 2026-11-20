output "bucket_names" {
  value = {
    for name, bucket in google_storage_bucket.bucket : name => bucket.name
  }
}

output "bucket_urls" {
  value = {
    for name, bucket in google_storage_bucket.bucket : name => bucket.url
  }
}

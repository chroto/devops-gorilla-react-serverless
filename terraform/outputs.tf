output "s3_bucket" {
  value = "${module.my-app.s3_bucket_id}"
}

output "domain_name" {
  value = "${module.my-app.domain_name}"
}

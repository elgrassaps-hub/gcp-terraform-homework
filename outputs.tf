output "bucket_name" { value = google_storage_bucket.homework_bucket.name }
output "dataset_id"  { value = google_bigquery_dataset.homework_dataset.dataset_id }
output "vm_name"     { value = google_compute_instance.homework_vm.name }
output "vm_internal_ip" {
  value = google_compute_instance.homework_vm.network_interface[0].network_ip
}

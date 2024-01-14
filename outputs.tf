output "instance_image" {
  value = google_compute_instance.default.boot_disk.0.initialize_params.0.image
}

output "instance_self_link" {
  value = google_compute_instance.default.self_link
}


output "vm-easetravel-ip" {
  value = google_compute_instance.vm-easetravel-app.network_interface[0].access_config[0].nat_ip
}
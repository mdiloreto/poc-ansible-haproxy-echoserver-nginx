output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "subnet_name" {
  value = google_compute_subnetwork.network-with-private-secondary-ip-ranges[*].name
}
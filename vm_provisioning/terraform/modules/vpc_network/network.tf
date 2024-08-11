resource "google_compute_network" "vpc_network" {
  name = var.network_name
  project = var.project_id
  auto_create_subnetworks = var.network_subnet_auto
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  count         = var.subnets_count
  name          = "${var.subnet_name}-${count.index}"
  ip_cidr_range = var.ip_cidr_range  # default "10.1.0.0/24"
  region        = var.subnet_region
  network       = google_compute_network.vpc_network.name
  description   = var.description
#   secondary_ip_range {
#     range_name = var.subnet_range_name
#     ip_cidr_range = var.subnet_secip_ip_cidr_range
#   } 
  depends_on = [ google_compute_network.vpc_network ]
}

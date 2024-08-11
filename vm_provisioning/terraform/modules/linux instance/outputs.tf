output "ipv4-addresses" {
  value = [for instance in google_compute_instance.default : instance.network_interface[0].network_ip]
}

output "instance_public_ips" {
  value = [ for instance in google_compute_instance.default : instance.network_interface[0].access_config[0].nat_ip ]
  description = "The public IP addresses of the VM instances"
}

output "self_link" {
  value = [ for instance in google_compute_instance.default : instance.self_link ]
}

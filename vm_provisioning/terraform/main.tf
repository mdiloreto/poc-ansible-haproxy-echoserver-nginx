resource "google_project_service" "iam_api" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false

}
module "vpc_network" {
  source        = "./modules/vpc_network"
  subnet_region = var.region
  network_name  = var.network_name
  subnet_name   = var.subnet_name
  project_id    = var.project_id
  region        = var.region
  ip_cidr_range = "10.0.0.0/24"
}

module "linux_vm_debian" {
  count        = 1
  source       = "./modules/linux instance"
  vm_name      = "haproxy-poc"
  project      = var.project_id
  region       = var.region
  zone         = var.zone
  network_name = module.vpc_network.network_name
  subnet_name  = module.vpc_network.subnet_name[0]
  depends_on   = [module.vpc_network]
  startup_script = "./scripts/startup_script.sh"
}

resource "null_resource" "run_ansible_playbook" {
  depends_on = [google_compute_instance.haproxy_vm]

  provisioner "local-exec" {
    command = <<EOT
      gcloud compute ssh ${google_compute_instance.linux_vm_debian.name} \
      --zone ${google_compute_instance.linux_vm_debian.zone} \
      --command 'ansible-playbook /tmp/haproxy-poc/playbooks/deploy.yml && echo "Playbook executed successfully." || { echo "Playbook execution failed"; exit 1; }'
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

module "firewall-rules" {
  source = "./modules/firewall_rules"

  rules = [
    {
      name               = var.fw_rule_name
      action             = "allow"
      network            = var.network_name
      protocol           = var.fw_protocol
      ports              = var.fw_ports
      source_ranges      = var.fw_source_rg
      destination_ranges = flatten([
                              for vm in module.linux_vm_debian : [
                                for ip in vm.ipv4-addresses : "${ip}/32"
                              ]
                            ]),
      source_tags        = []                              
    },
    {
      name               = var.fw_rule_name2
      action             = "allow"
      network            = var.network_name
      protocol           = var.fw_protocol2
      ports              = var.fw_ports2
      source_ranges      = var.fw_source_rg2
      destination_ranges = flatten([
                            for vm in module.linux_vm_debian : [
                                for ip in vm.ipv4-addresses : "${ip}/32"
                              ]
                            ]),
      source_tags        = []
    }
  ]
}

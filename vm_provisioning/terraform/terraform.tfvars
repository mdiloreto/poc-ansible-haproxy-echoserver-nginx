region          = "us-east4"
zone            = "us-east4-a"

network_name    = "haproxy-poc-vpc"
subnet_name     = "haproxy-poc-vpc-sn"

fw_rule_name   = "allow-ingress-to-22-target-vm"
fw_ports       = ["22"]
fw_source_rg   = ["0.0.0.0/0"]
fw_source_tags = []
fw_protocol    = "tcp"

fw_rule_name2   = "allow-80-target-vm"
fw_ports2       = ["80"]
fw_source_rg2   = ["0.0.0.0/0"]
fw_source_tags2 = []
fw_protocol2    = "tcp"
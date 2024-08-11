variable "project_id" {}
variable "region" {}
variable "zone" {}

variable "network_name" {}
variable "subnet_name" {}

variable "service_account" {
  default = null
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template#service_account."
}
## Firewall variables 

variable "fw_source_tags" {
  description = "Source Tag list"
  type        = list(string)
}

variable "fw_ports" {
  type = list(number)
}

variable "fw_source_rg" {
  description = "Source ip ranges for the rule"
}

variable "fw_rule_name" {
  type        = string
  description = "Name of the firewall rule"
}

variable "fw_protocol" {
  type        = string
  description = "Protocol for the rule"
}

## Firewall variables  2

variable "fw_source_tags2" {
  description = "Source Tag list"
  type        = list(string)
}

variable "fw_ports2" {
  type = list(number)
}

variable "fw_source_rg2" {
  description = "Source ip ranges for the rule"
}

variable "fw_rule_name2" {
  type        = string
  description = "Name of the firewall rule"
}

variable "fw_protocol2" {
  type        = string
  description = "Protocol for the rule"
}
variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "default-vpc-network"
}

variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "network_subnet_auto" {
  description = "Determines if subnetworks are created automatically"
  type        = bool
  default     = false
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default-subnet"
}

variable "ip_cidr_range" {
  description = "The primary IP CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet_region" {
  description = "The region in which the subnet will be created"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "The name or self_link of the network to which the subnet belongs"
  type        = string
  default     = "default-vpc-network"
}

variable "description" {
  description = "An optional description of this resource"
  type        = string
  default     = "Default subnet in VPC"
}

variable "subnet_range_name" {
  description = "The name of the secondary IP range for the subnet"
  type        = string
  default     = "secondary-range"
}

variable "subnet_secip_ip_cidr_range" {
  description = "The CIDR block for the secondary IP range of the subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "region" {
  description = "The region where the subnet will be created"
  type        = string
  default     = "us-central1"
}

variable "subnets_count" {
  default = "1"
}
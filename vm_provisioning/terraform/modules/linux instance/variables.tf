# variable "vm_tags" {
#   description = "List of tag maps for each VM"
#   type        = list(map(string))
#    default     = [
#     {
#       #"Role" = "example",
#       #"Env"  = "production"
#     }
#     # Add more maps as needed for each VM
#   ]
# }




variable "disk_labels" {
  description = "List of tag maps for each VM"
  type        = list(map(string))
  default     = [{}]
}

variable "vm_metadata" {
  description = "List of tag maps for each VM"
  type        = list(map(string))
  default     = [{}]
}

variable "vm_sa_scopes" {
  description = "List of IAM scopes for the VM's service account"
  type        = list(string)
  default     = []
}

variable "create_network" {
  description = "Boolean to decide whether to create the network or not"
  type        = bool
  default     = false
}

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "default-network"
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "network_subnet_auto" {
  description = "Boolean to decide whether to auto-create subnets or not"
  type        = bool
  default     = false
}

variable "subnet_name" {
  description = "List of names for each subnet"
  type        = string
  default     = "default-subnet"
}

variable "ip_cidr_range" {
  description = "The CIDR range for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "region" {
  description = "The GCP region for the subnet"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "The network to which the subnet is attached"
  type        = string
  default     = "default-network"
}

variable "create_vm_sa" {
  description = "Boolean to decide whether to create a service account for the VM or not"
  type        = bool
  default     = false
}

variable "sa_account_id" {
  description = "The ID of the service account"
  type        = string
  default     = "vm-sa"
}

variable "sa_display_name" {
  description = "The display name of the service account"
  type        = string
  default     = "My VM Service Account"
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
  default     = "my-vm"
}

variable "machine_size" {
  description = "The machine type of the VM"
  type        = string
  default     = "n1-standard-2"
}

variable "zone" {
  description = "The zone in which the VM is deployed"
  type        = string
  default     = "us-central1-a"
}

variable "vm_image" {
  description = "The image used for the VM's boot disk"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "scratch_disk_interface" {
  description = "The interface type of the scratch disk"
  type        = string
  default     = "SCSI"
}

variable "startup_script" {
  description = "The startup script to be used"
  type        = string
  default     = null
}

variable "vm_count" {
  default = "1"
}

variable "subnet_create" {
  type = bool
  default = false
}

# variable "pub_key" {
#   description = "Path to the public key file."
#   default = "private.key"
# }
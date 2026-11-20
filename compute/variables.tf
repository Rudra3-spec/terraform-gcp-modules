
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "vms" {
  description = "List of VMs to create"

  type = list(object({
    name                  = string
    machine_type          = string
    zone                  = string
    subnetwork            = string
    service_account_email = optional(string)
  }))
}

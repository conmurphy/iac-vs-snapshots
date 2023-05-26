terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
    }
  }
}

variable "apic_password" {
}

provider "aci" {
  username = "admin"
  password = var.apic_password
  url      = "https://198.18.133.200"
  insecure = true
  retries  = 4
}


module "aci" {
  source  = "netascode/nac-aci/aci"
  version = "0.7.0"

  yaml_directories = ["data"]

  manage_access_policies    = false
  manage_fabric_policies    = false
  manage_pod_policies       = false
  manage_node_policies      = false
  manage_interface_policies = false
  manage_tenants            = true
}
# vSphere-ISO
variable "vsphere-iso_vcenter_server" {
  type = string
}

variable "vsphere-iso_host" {
  type = string
}

variable "vsphere-iso_username" {
  type = string
}

variable "vsphere-iso_password" {
  type = string
}

variable "vsphere-iso_datastore" {
  type = string
}

variable "vsphere-iso_iso_paths" {
  type = list (string)
}

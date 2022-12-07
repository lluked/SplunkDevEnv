# Build
variable "headless" {
  description = "When this value is set to true, the machine will start without a console."
  type = bool
  default = true
}

variable "boot_wait_virtualbox" {
  description = "The time to wait after booting the initial virtual machine before typing the boot_command."
  type = string
  default = "5s"
}

variable "boot_wait_vmware" {
  description = "The time to wait after booting the initial virtual machine before typing the boot_command."
  type = string
  default = "5s"
}

# CD
variable "cd_label" {
  description = "CD Label"
  type = string
  default = "OEMDRV"
}

# SSH
variable "ssh_username" {
  description = "The username to connect to SSH with. Required if using SSH."
  type = string
  sensitive = true
  default = "root"
}

variable "ssh_password" {
  description = "A plaintext password to use to authenticate with SSH."
  type = string
  sensitive = true
  default = "packer"
}

variable "ssh_pty" {
  description = "If true, a PTY will be requested for the SSH connection."
  type    = string
  default = "false"
}

variable "ssh_timeout" {
  description = "The time to wait for SSH to become available."
  type = string
  default = "30m"
}

variable "ssh_handshake_attempts" {
  description = "The number of handshakes to attempt with SSH once it can connect."
  type = number
  default = 100
}

# Machine Settings
variable "cpus" {
  description = "The number of cpus to use when building the VM."
  type    = number
  default = 1
}

variable "disk_size" {
  description = "The size for the virtual disk in MB"
  type = number
  default = 40000
}

variable "firmware" {
  description = " Set the Firmware for virtual machine. Supported values: bios, efi or efi-secure."
  type = string
  default = "bios"
}

variable "memory" {
  description = " The amount of memory to use when building the VM in megabytes."
  type = number
  default = 8192
}

variable "tools_upload_flavor" {
  description = "The flavor of the VMware Tools ISO to upload into the VM."
  type = string
  default = ""
}

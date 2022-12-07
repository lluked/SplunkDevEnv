## Source blocks
source "virtualbox-iso" "redhat" {
  boot_command           = "${var.redhat_boot_command}"
  boot_wait              = "${var.boot_wait_virtualbox}"
  cd_files               = "${var.redhat_cd_files}"
  cd_label               = "${var.cd_label}"
  cpus                   = "${var.cpus}"
  disk_size              = "${var.disk_size}"
  export_opts            = [
    "--manifest",
    "--vsys", "0"
    ]
  format                 = "ova"
  gfx_controller         = "vmsvga"
  gfx_vram_size          = "32"
  guest_additions_path   = "/tmp/VBoxGuestAdditions.iso"
  guest_os_type          = "RedHat_64"
  hard_drive_interface   = "sata"
  headless               = "${var.headless}"
  iso_checksum           = "${var.redhat_iso_checksum_type}:${var.redhat_iso_checksum}"
  iso_urls               = ["${var.redhat_iso_path}/${var.redhat_iso_name}", "${var.redhat_iso_url}"]
  memory                 = "${var.memory}"
  output_directory       = "output/${var.redhat_vm_name}_VirtualBox/"
  shutdown_command       = "echo ${var.ssh_password} | sudo -S shutdown -P now"
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_pty                = "${var.ssh_pty}"
  ssh_timeout            = "${var.ssh_timeout}"
  ssh_username           = "${var.ssh_username}"
  vboxmanage             = [
    ["modifyvm", "{{ .Name }}", "--vrde", "off"]
  ]
  vm_name                = "${var.redhat_vm_name}_VirtualBox"
}

source "vmware-iso" "redhat" {
  boot_command           = "${var.redhat_boot_command}"
  boot_wait              = "${var.boot_wait_vmware}"
  cd_label               = "${var.cd_label}"
  cd_files               = "${var.redhat_cd_files}"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "rhel8-64"
  headless               = "${var.headless}"
  iso_checksum           = "${var.redhat_iso_checksum_type}:${var.redhat_iso_checksum}"
  iso_urls               = ["${var.redhat_iso_path}/${var.redhat_iso_name}", "${var.redhat_iso_url}"]
  memory                 = "${var.memory}"
  output_directory       = "output/${var.redhat_vm_name}_VMWare/"
  shutdown_command       = "echo ${var.ssh_password} |sudo -S shutdown -P now"
  skip_compaction        = false
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_pty                = "${var.ssh_pty}"
  ssh_timeout            = "${var.ssh_timeout}"
  ssh_username           = "${var.ssh_username}"
  tools_upload_flavor    = "linux"
  vm_name                = "${var.redhat_vm_name}_VMWare"
}

source "vsphere-iso" "redhat" {
  boot_command           = "${var.redhat_boot_command}"
  boot_wait              = "${var.boot_wait_vmware}"
  cd_files               = "${var.redhat_cd_files}"
  cd_label               = "${var.cd_label}"
  guest_os_type          = "rhel8_64Guest"
  shutdown_command       = "echo ${var.ssh_password} |sudo -S shutdown -P now"
  ssh_handshake_attempts = "${var.ssh_handshake_attempts}"
  ssh_password           = "${var.ssh_password}"
  ssh_pty                = "${var.ssh_pty}"
  ssh_timeout            = "${var.ssh_timeout}"
  ssh_username           = "${var.ssh_username}"
  vm_name                = "${var.redhat_vm_name}"
  # vSphere-ISO specific
  vcenter_server         = "${var.vsphere-iso_vcenter_server}"
  host                   = "${var.vsphere-iso_host}"
  username               = "${var.vsphere-iso_username}"
  password               = "${var.vsphere-iso_password}"
  datastore              = "${var.vsphere-iso_datastore}"
  iso_paths              = "${var.vsphere-iso_iso_paths}"
  RAM                    = "${var.memory}"
  network_adapters {
    network = "VM Network"
    network_card = "vmxnet3"
  }
  insecure_connection    = true
  storage {
    disk_size = 100000
    disk_thin_provisioned = true
  }
}

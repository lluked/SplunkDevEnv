# Build
build {
  name = "vagrant"
  sources = [
    "virtualbox-iso.redhat",
    "vmware-iso.redhat",
  ]
  provisioner "shell" {
    execute_command = "echo '${var.ssh_password}' | sudo -S env {{ .Vars }} {{ .Path }}"
    scripts         = [
      "scripts/vagrant.sh",
      "scripts/virtualbox.sh",
      "scripts/vmware.sh"
    ]
  }
  provisioner "ansible" {
    playbook_file = "../../ansible/site-all.yml"
    ansible_ssh_extra_args = [
      "-oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"
    ]
    extra_arguments = [ "-v" ]
  }
  post-processor "vagrant" {
    keep_input_artifact = false
    output = "output/{{.ArtifactId}}.box"
  }
}

build {
  name = "esxi"
  sources = [
    "vsphere-iso.redhat"
  ]
  provisioner "ansible" {
    playbook_file = "../../ansible/site-all.yml"
    ansible_ssh_extra_args = [
      "-oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"
    ]
    extra_arguments = [
      "-v",
      "--scp-extra-args", "'-O'"
    ]
  }
}

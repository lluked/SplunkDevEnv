## Required plugins
packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.0.4"
      source = "github.com/hashicorp/virtualbox"
    }
    vmware = {
      version = ">= 1.0.7"
      source = "github.com/hashicorp/vmware"
    }
    vsphere = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}

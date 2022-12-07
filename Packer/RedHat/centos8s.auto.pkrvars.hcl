###
### CentOS Stream 8 Auto Vars
###

redhat_vm_name           = "Splunk-Dev(CentOS8S)"
redhat_cd_files          = ["./OEMDRV/centos8s_ks.cfg"]
redhat_boot_command      = ["<tab> inst.ks=hd:/dev/sr1:/centos8s_ks.cfg<enter>"]
redhat_iso_name          = "CentOS-Stream-8-x86_64-latest-boot.iso"
redhat_iso_url           = "http://mirrors.gethosted.online/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-latest-boot.iso"
redhat_iso_path          = "./iso"
# Checksum file fails to read from repo, manually update checksum if needed
redhat_iso_checksum_type = "sha256"
redhat_iso_checksum      = "a96b15fdea3842de667b2472ee10842db6bd1ec9a7e76f58541b5b0d59433349"
// redhat_iso_checksum_type = "file"
// redhat_iso_checksum      = "http://mirrors.gethosted.online/centos/8-stream/isos/x86_64/CHECKSUM"
vsphere-iso_iso_paths      = ["[SSD] ISO/CentOS-Stream-8-x86_64-latest-boot.iso"]
vsphere-iso_datastore      = "SSD"

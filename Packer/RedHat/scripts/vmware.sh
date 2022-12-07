#!/bin/sh -eux

case "$PACKER_BUILDER_TYPE" in
vmware-iso|vmware-vmx)

    yum -y install open-vm-tools;
    ;;

esac

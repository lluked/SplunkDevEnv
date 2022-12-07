#!/bin/sh -eux

case "$PACKER_BUILDER_TYPE" in
virtualbox-iso|virtualbox-ovf)

    ISO="/tmp/VBoxGuestAdditions.iso";
    MOUNT="/tmp/VBoxGuestAdditions";
    BUILD_PACKAGES="perl cpp gcc make bzip2 tar";
    KERNEL_PACKAGES="kernel-headers kernel-devel kernel-uek-devel";
    PACKAGES="${BUILD_PACKAGES} ${KERNEL_PACKAGES}";

    # Mount the ISO
    mkdir -p $MOUNT;
    mount -o loop $ISO $MOUNT;

    # Install required packages
    yum install -y --skip-broken $PACKAGES || true;

    # Install VBoxAdditions
    $MOUNT/VBoxLinuxAdditions.run --nox11 || true;
    if ! modinfo vboxsf >/dev/null 2>&1; then
        echo "Cannot find vbox kernel module. Installation of guest additions unsuccessful!";
        exit 1;
    fi

    # Unmount and cleanup
    umount $MOUNT;
    rm -rf $MOUNT;
    rm -f $ISO;

    # Remove kernel packages
    yum remove -y $KERNEL_PACKAGES;

    # Cleanup logs
    rm -rf /var/log/vboxadd*;
    ;;

esac

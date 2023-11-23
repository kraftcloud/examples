#!/bin/sh

config="fc.json"

if test $# -eq 1; then
    config="$1"
fi

rootfs="rootfs/"

# Clean up any previous instances.
sudo pkill -f qemu-system > /dev/null 2>&1
sudo pkill -f firecracker > /dev/null 2>&1
sudo kraft stop --all > /dev/null 2>&1
sudo kraft rm --all > /dev/null 2>&1

# Create CPIO archive to be used as the initrd.
old="$PWD"
cd "$rootfs"
find -depth -print 2> /dev/null | tac | bsdcpio -o --format newc > "$old"/rootfs.cpio 2> /dev/null
cd "$old"

# Remove previously created network interfaces.
sudo ip link set dev tap0 down 2> /dev/null
sudo ip link del dev tap0 2> /dev/null
sudo ip link set dev virbr0 down 2> /dev/null
sudo ip link del dev virbr0 2> /dev/null

# Create tap interface for Firecracker networking.
sudo ip tuntap add dev tap0 mode tap
sudo ip address add 172.44.0.1/24 dev tap0
sudo ip link set dev tap0 up

# Remove previously created files.
sudo rm -f /tmp/firecracker.log
> /tmp/firecracker.log
sudo rm -f /tmp/firecracker.socket
sudo firecracker-x86_64 \
    --api-sock /tmp/firecracker.socket \
    --config-file "$config"

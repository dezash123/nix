#!/usr/bin/env bash

vm_name="win10"
export LIBVIRT_DEFAULT_URI="qemu:///system"

hyprctl dispatch workspace 6

if ! virsh domstate "$vm_name" | grep -qi '^running$'; then
  virsh start "$vm_name"
fi

virt-viewer -f -w -a "$vm_name"

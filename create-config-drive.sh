#!/bin/sh
# for reference, visit https://github.com/coreos/coreos-cloudinit/blob/master/Documentation/config-drive.md
function create_config_drive() {
  # pass in the user_data file as the first argument
  mkdir -p /tmp/new-drive/openstack/latest
  cp $1 /tmp/new-drive/openstack/latest/$1
  mkisofs -R -V config-2 -o configdrive.iso /tmp/new-drive
  rm -r /tmp/new-drive
}

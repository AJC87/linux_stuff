#!/bin/bash
# Script to help with Logical Volume Management

readonly DEVICE_NAME='sda'
readonly NEW_PARTITION_ID=''
readonly PARTITION="/dev/${DEVICE_NAME}${NEW_PARTITION_ID}"
readonly VOLUME_GROUP='testvg'
readonly VOLUME_SIZE='100M'
readonly LOGICAL_VOLUME='testlvm'
readonly MOUNT_POINT='/testpoint'

# TODO: can this be done non-interactively, make them logical volume
# sudo fdisk "/dev/${DEVICE_NAME}"

# TODO: do a check with this
sudo partprobe -s

# Make them physical
sudo pvcreate "${PARTITION}"
# TODO: do a check with this
sudo pvdisplay

# Can supply more partitions
sudo vgcreate "${VOLUME_GROUP}" "${PARTITION}"
# TODO: do a check with this
sudo vgdisplay

sudo lvcreate -L "${VOLUME_SIZE}" -n "${LOGICAL_VOLUME}" "${VOLUME_GROUP}"
# TODO: do a check with this
sudo lvdisplay

sudo mkfs.ext4 "/dev/${VOLUME_GROUP}/${LOGICAL_VOLUME}"
sudo mkdir "${MOUNT_POINT}"
# TODO: refactor
sudo mount "/dev/${VOLUME_GROUP}/${LOGICAL_VOLUME}" "${MOUNT_POINT}"

# To persist between boots
sudo sh -c "echo '/dev/${VOLUME_GROUP}/${LOGICAL_VOLUME} ${MOUNT_POINT} ext4 defaults 0 0' >> /etc/fstab"

# Resize
# sudo lvresize -r -L 200M /dev/${VOLUME_GROUP}/${LOGICAL_VOLUME}

#!/bin/bash
sudo mount /dev/sda1 /mnt  # Replace with your root partition
sudo mount --bind /dev /mnt/dev
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
sudo chroot /mnt
grub-install /dev/sda  # Replace with your disk
update-grub
exit
sudo umount /mnt/dev /mnt/proc /mnt/sys
echo "GRUB bootloader repaired."


##sudo chroot /mnt systemctl enable --now gdm



##sudo chroot /mnt btrfs subvolume snapshot /@ /.

sudo chroot /mnt apt install timeshift


swapoff --all
umount --all

reboot

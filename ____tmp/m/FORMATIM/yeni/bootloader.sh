

sudo chroot /mnt apt install grub-efi-amd64 -y
sudo chroot /mnt update-grub
sudo chroot /mnt grub-install

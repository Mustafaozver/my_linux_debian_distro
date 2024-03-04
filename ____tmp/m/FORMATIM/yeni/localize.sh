sudo chroot /mnt apt install locales -y
sudo chroot /mnt dpkg-reconfigure locales
sudo chroot /mnt dpkg-reconfigure tzdata
sudo chroot /mnt locale-gen

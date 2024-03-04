

sudo chroot /mnt apt install linux-image-generic -y
sudo chroot /mnt apt install grub-efi-amd64 -y

sudo chroot /mnt apt install btrfogs -y
sudo chroot /mnt apt install exfatprogs -y
sudo chroot /mnt apt install exfat-utils -y
sudo chroot /mnt apt install debootstrap -y
sudo chroot /mnt apt install genfstab -y
sudo chroot /mnt apt install zfsutils-linux -y
sudo chroot /mnt apt install zfs-initramfs -y
sudo chroot /mnt apt install zfs-dkms -y


systemctl start zfs-zed.service
modprobe zfs

sudo chroot /mnt systemctl start zfs-zed.service
sudo chroot /mnt modprobe zfs


sudo chroot /mnt apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget -y










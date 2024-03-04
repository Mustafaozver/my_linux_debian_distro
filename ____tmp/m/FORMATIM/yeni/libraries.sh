

sudo chroot /mnt apt install lightdm lightdm-gtk-greeter -y
sudo chroot /mnt apt install kde-full -y
sudo chroot /mnt apt install plasma-workspace-wayland -y
sudo chroot /mnt apt install kubuntu-desktop -y
sudo chroot /mnt apt install plasma-desktop -y
sudo chroot /mnt apt install samba -y

kio-admin


sudo chroot /mnt apt install exfat-utils -y
sudo chroot /mnt apt install btrfs-progs zfsutils-linux zfs-initramfs zfs-dkms -y




sudo chroot /mnt apt install git dosfstools amd64-microcode nano -y

sudo chroot /mnt apt install dosfstools amd64-microcode network-manager git cryptsetup sudo -y

sudo chroot /mnt apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo chroot /mnt apt install cups printer-driver-all system-config-printer simple-scan xsane -y

sudo chroot /mnt apt install tzdata curl ca-certificates openssh-server curl -y

sudo chroot /mnt apt install sensors-applet -y
sudo chroot /mnt apt install psensor fancontrol -y
sudo chroot /mnt apt install tlp ubuntu-restricted-extras -y

sudo chroot /mnt apt install ufw -y

sudo chroot /mnt ubuntu-drivers autoinstall

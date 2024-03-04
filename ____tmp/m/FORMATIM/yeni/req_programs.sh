






sudo chroot /mnt apt remove --purge snapd
sudo chroot /mnt apt install synaptic -y
sudo chroot /mnt apt install flatpak -y
sudo chroot /mnt apt install nala -y

sudo chroot /mnt apt install libreoffice -y





sudo chroot /mnt apt install wget gpd nano -y





sudo chroot /mnt nala install firefox

sudo chroot /mnt apt update
sudo chroot /mnt apt --fix-missing update
sudo chroot /mnt apt --fix-broken install
sudo chroot /mnt apt autoremove
sudo chroot /mnt apt clean




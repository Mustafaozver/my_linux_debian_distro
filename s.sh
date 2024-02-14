ROOTFOLDERNAME="dchroot"


#
echo "$_ST Güncelleştirmeler yükleniyor...                    $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt update
sudo chroot ./"$ROOTFOLDERNAME" apt upgrade -y

sudo chroot ./"$ROOTFOLDERNAME" apt-add-repository universe -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:unit193/encryption -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:alessandro-strada/ppa -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:flatpak/stable -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:libreoffice -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:obsproject/obs-studio -y
sudo chroot ./"$ROOTFOLDERNAME" add-apt-repository ppa:danielrichter2007/grub-customizer -y

sudo chroot ./"$ROOTFOLDERNAME" apt update
sudo chroot ./"$ROOTFOLDERNAME" apt upgrade -y

#
echo "$_ST Generic çekirdek yükleniyor...                     $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install linux-image-generic -y


#
echo "$_ST Gerekli kütüphaneler yükleniyor...                 $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install xorg xinit -y
sudo chroot ./"$ROOTFOLDERNAME" apt install atmel-firmware bluez-firmware dahdi-firmware-nonfree -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-amd-graphics firmware-ath9k-htc firmware-atheros -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-b43-installer firmware-b43legacy-installer firmware-bnx2 -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-bnx2x firmware-brcm80211 firmware-cavium -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-intel-sound firmware-intelwimax firmware-ipw2x00 -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-ivtv firmware-iwlwifi firmware-libertas -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-linux firmware-linux-free firmware-linux-nonfree -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-misc-nonfree firmware-myricom firmware-netronome -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-netxen firmware-qcom-soc firmware-qlogic -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-realtek firmware-samsung firmware-siano -y
sudo chroot ./"$ROOTFOLDERNAME" apt install firmware-sof-signed firmware-ti-connectivity firmware-zd1211 hdmi2usb-fx2-firmware -y

sudo chroot ./"$ROOTFOLDERNAME" apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo chroot ./"$ROOTFOLDERNAME" apt install cups printer-driver-all system-config-printer simple-scan xsane -y

sudo chroot ./"$ROOTFOLDERNAME" apt install tzdata curl ca-certificates openssh-server curl -y

sudo chroot ./"$ROOTFOLDERNAME" apt install sensors-applet -y
sudo chroot ./"$ROOTFOLDERNAME" apt install psensor fancontrol -y
sudo chroot ./"$ROOTFOLDERNAME" apt install tlp ubuntu-restricted-extras -y

sudo chroot ./"$ROOTFOLDERNAME" apt install ufw -y

sudo chroot ./"$ROOTFOLDERNAME" ubuntu-drivers autoinstall

#
echo "$_ST Paketleyiciler ayarlanıyor...                      $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt remove --purge snapd -y
sudo chroot ./"$ROOTFOLDERNAME" apt install nala nala-legacy -y
sudo chroot ./"$ROOTFOLDERNAME" apt install flatpak -y
sudo chroot ./"$ROOTFOLDERNAME" apt install synaptic -y

#
echo "$_ST BTRFS ve ZFS Dosya sistemleri yükleniyor...        $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install exfat-utils -y
sudo chroot ./"$ROOTFOLDERNAME" apt install btrfs-progs zfsutils-linux zfs-initramfs zfs-dkms -y

#
echo "$_ST Yerelleştirme ayarları yükleniyor...               $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install locales -y

#
echo "$_ST Sistem araçları yükleniyor...                      $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install wget gpd nano -y
sudo chroot ./"$ROOTFOLDERNAME" apt install wine wine32 libwine fonts-wine -y
sudo chroot ./"$ROOTFOLDERNAME" apt install grub-customizer -y
sudo chroot ./"$ROOTFOLDERNAME" apt install neofetch zsh guake fish -y

#
echo "$_ST KDE Plasma yükleniyor...                           $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install lightdm kde-full -y
sudo chroot ./"$ROOTFOLDERNAME" apt install plasma-workspace-wayland -y
sudo chroot ./"$ROOTFOLDERNAME" apt install kubuntu-desktop -y
sudo chroot ./"$ROOTFOLDERNAME" apt install plasma-desktop -y
sudo chroot ./"$ROOTFOLDERNAME" apt install kwin-bismuth -y


#
echo "$_ST Sandbox ayarlamaları yapılıyor...                  $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install distrobox podman -y


#
echo "$_ST Programlar yükleniyor...                           $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt install veracrypt -y
sudo chroot ./"$ROOTFOLDERNAME" apt install chromium -y
sudo chroot ./"$ROOTFOLDERNAME" apt install opera-stable -y
sudo chroot ./"$ROOTFOLDERNAME" apt install thunderbird -y
sudo chroot ./"$ROOTFOLDERNAME" apt install libreoffice -y


#
echo "$_ST Dahili düzenlemeler bekleniyor...                  $_FN"

sudo chroot ./"$ROOTFOLDERNAME" sh /setup/inner_install.sh


#
echo "$_ST Yüklenen ppaketler kontrol ediliyor...             $_FN"

sudo chroot ./"$ROOTFOLDERNAME" apt --fix-missing update
sudo chroot ./"$ROOTFOLDERNAME" apt --fix-broken install
sudo chroot ./"$ROOTFOLDERNAME" apt autoremove
sudo chroot ./"$ROOTFOLDERNAME" apt clean


#
echo "$_ST Grub Önyükleyici yapılandırılıyor...               $_FN"

sudo chroot ./"$ROOTFOLDERNAME" update-grub
sudo chroot ./"$ROOTFOLDERNAME" grub-install



#
echo "$_ST Tamamlanıyor...                                    $_FN"

sudo chroot ./"$ROOTFOLDERNAME" bash



#
echo "$_ST                                                    $_FN"
echo "$_ST Kurulum tamamlandı.                                $_FN"



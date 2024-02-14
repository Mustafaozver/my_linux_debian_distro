#!/bin/bash

if [ "$(whoami)" != root ]; then
    echo "\033[31m Bu komut çalışmak için root yetkisine ihtiyaç duyuyor."
    echo "\033[31m Önce sudo su komutu ile root olmalısınız veya sudo ön komutu ile çalıştırmalısınız."
    echo "\033[31m Örnek : '\033[35m sudo sh ./dependencies.sh\033[31m ' komutunu çalıştırabilirsiniz"
    exit 1
fi

RESET_CONSOLE="\033[0m"
BACKGRUND_WHITE="\033[47m"
TEXT_BLUE="\033[34m"
STATUS_BLINK="\033[5m"
FONT_BOLD="\033[1m"

_ST="$BACKGRUND_WHITE$TEXT_BLUE$FONT_BOLD"
_FN="$RESET_CONSOLE"

MYDIR="$(dirname "$(realpath "$0")")/"

##sudo su

echo "$_ST                                                    $_FN"
echo "$_ST Gerekli Paketler Yükleniyor...                     $_FN"

sudo apt update
sudo apt upgrade -y

sudo apt install debootstrap xorriso squashfs-tools mtools grub-pc-bin grub-efi devscripts git nano -y

sudo apt install exfat-utils -y
sudo apt install genfstab -y
sudo apt install btrfs-progs zfsutils-linux zfs-initramfs zfs-dkms -y


echo "$_ST                                                    $_FN"
echo "$_ST Kurulum tamamlandı.                                $_FN"

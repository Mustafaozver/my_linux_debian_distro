#!/bin/bash

if [ "$(whoami)" != root ]; then
    echo "\033[31m Bu komut çalışmak için root yetkisine ihtiyaç duyuyor."
    echo "\033[31m Önce sudo su komutu ile root olmalısınız veya sudo ön komutu ile çalıştırmalısınız."
    echo "\033[31m Örnek : '\033[35m sudo sh ./build_0.sh\033[31m ' komutunu çalıştırabilirsiniz"
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

ROOTFOLDERNAME="debroot"

##sudo su

echo "$_ST                                                    $_FN"
echo "$_ST ISO imajı üretiliyor...                            $_FN"
sleep 1


#
echo "$_ST ISO Uygulamaları yüleniyor...                      $_FN"
sleep 1

sudo chroot ./"$ROOTFOLDERNAME" apt autoremove
sudo chroot ./"$ROOTFOLDERNAME" apt update
sudo chroot ./"$ROOTFOLDERNAME" apt upgrade -y



sudo umount -lf -R ./"$ROOTFOLDERNAME"/* 2>/dev/null

sudo chroot ./"$ROOTFOLDERNAME" apt autoremove

sudo rm -f ./"$ROOTFOLDERNAME"/root/.bash_history
sudo rm -rf ./"$ROOTFOLDERNAME"/var/lib/apt/lists/*

find ./"$ROOTFOLDERNAME"/var/log/ -type f | xargs rm -f

mkdir ./tmp/iso

sudo mksquashfs ./"$ROOTFOLDERNAME" ./tmp/filesystem.squashfs -comp gzip -wildcards

mkdir -p ./tmp/iso/live

mv ./tmp/filesystem.squashfs ./tmp/iso/live/filesystem.squashfs



sudo cp -pf ./"$ROOTFOLDERNAME"/boot/initrd.img* ./tmp/iso/live/
sudo cp -pf ./"$ROOTFOLDERNAME"/boot/vmlinuz* ./tmp/iso/live/

mkdir -p ./tmp/iso/boot/grub/

cp ./_files/grub.cfg ./tmp/iso/boot/grub/

sudo grub-mkrescue ./tmp/iso -o ./tmp/mydistro.iso








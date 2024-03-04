#!/bin/bash


RESET_CONSOLE="\033[0m"
BACKGRUND_WHITE="\033[44m"
TEXT_BLUE="\033[38m"
STATUS_BLINK="\033[5m"
FONT_BOLD="\033[1m"

_ST="$BACKGRUND_WHITE$TEXT_BLUE$FONT_BOLD"
_FN="$RESET_CONSOLE"
_FULLBLANK="                                                                                                                                                            "
_SEPERATOR="\033[38m||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\033[0m"

echo "$_ST$_FULLBLANK$_FN"
echo "$_SEPERATOR"
echo " >> KDE Plasma Ayarları yükleniyor..."

CROOT_DIR="$(dirname "$(realpath "$0")")/__root"
CHOME_DIR="$(dirname "$(realpath "$0")")/__home"

ROOT_DIR="/"
HOME_DIR="$(echo ~)"

sudo cp -r "$CROOT_DIR/" "$ROOT_DIR"/
sudo cp -r "$CHOME_DIR/" "$HOME_DIR"/


sudo qdbus org.kde.KWin /KWin reconfigure 
sudo konsole -e kquitapp5 plasmashell && kstart5 plasmashell --windowclass plasmashell --window Desktop








echo "$_ST$_FULLBLANK$_FN"
echo "$_SEPERATOR"
echo " >> Yükleme tamamlandı."

exit

mount /dev/nvme0n1p4 /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@snapshots
umount /mnt

mount -t btrfs -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/nvme0n1p4 /mnt

mkdir -p /mnt/.snapshots
mount -t btrfs -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots /dev/nvme0n1p4 /mnt/.snapshots

mkdir -p /mnt/home
mount /dev/nvme0n1p5 /mnt/home

mkdir -p /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot

mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi

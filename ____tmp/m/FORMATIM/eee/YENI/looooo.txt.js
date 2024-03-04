/*
sudo su

apt update
///apt ugrade

apt install exfatprogs exfat-utils -y
apt install debootstrap genfstab -y
apt install btrfs-progs zfsutils-linux zfs-initramfs zfs-dkms -y

apt install linux-image-generic grub-efi-amd64 -y

systemctl start zfs-zed.service
modprobe zfs





*/




// disk biçimlendirme
{
    const cmd = "sudo fdisk /dev/nvme0n1";

    const generate_gpt = "g\n";

    // g => yeni GPT tablosu
    // n + sırası + fstSector + lstSector => yeni bölüm
    // t + ?sırası + type => tür ayarla

    const uefi_part = "n\n1\n\n+512M\n";
    const uefi_type = "t\n1\n"; // sadece 1 bölüm olduğundan türü 1 olarak otomatik çeker

    const boot_part = "n\n2\n\n+1G\n";
    const boot_type = "t\n2\n20\n";

    const swap_part = "n\n3\n\n+16G\n";
    const swap_type = "t\n3\n19\n";

    const root_part = "n\n4\n\n+100G\n";
    const root_type = "t\n4\n23\n";

    const home_part = "n\n5\n\n+200G\n";
    const home_type = "t\n5\n42\n";

    const repo_part = "n\n6\n\n\n";
    const repo_type = "t\n6\n20\n";

    const write = "w\n";

}







// formatlar
{
    const swap_format = "mkswap /dev/nvme0n1p3";
    const swap_enable = "swapon /dev/nvme0n1p3";

    const uefi_format = "mkfs.vfat /dev/nvme0n1p1";
    const boot_format = "mkfs.ext4 /dev/nvme0n1p2";

    const root_format = "mkfs.btrfs /dev/nvme0n1p4";
    const home_format = "mkfs.ext4 /dev/nvme0n1p5";
    const repo_format = "mkfs.vfat /dev/nvme0n1p6";
}


/*

blkid

/dev/nvme0n1p1: UUID="67BC-DDC5" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="1b3519c8-9acd-401e-92cb-c11d77cd034f"
/dev/nvme0n1p2: UUID="9266556c-a863-4b68-b55d-faa07b963769" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="92fc5911-7e21-472e-87b0-f946e0ace9ea"
/dev/nvme0n1p3: UUID="c3db57e8-06cb-4b13-b83c-93e934fec5c8" TYPE="swap" PARTUUID="8a348072-d151-44d4-915a-31803543d153"
/dev/nvme0n1p4: UUID="3a7d8181-f36d-448e-9100-da160caf4c3c" UUID_SUB="d44e3fc6-ef6e-4ee6-86aa-0acd9866cbeb" BLOCK_SIZE="4096" TYPE="btrfs" PARTUUID="2c36890a-d2a5-4df9-ab4f-e3fad6564c6b"
/dev/nvme0n1p5: UUID="594e2367-2c1b-41ce-b854-a7c302a8478d" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="e1c7db1f-e55c-4130-8396-cd0df586bbbb"
/dev/nvme0n1p6: UUID="6C0C-D976" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="6086334b-8ebb-4ad1-9b90-c18ac6ee2aa3"



*/






// mount işlemleri

{ // root
    const f_mount = "mount /dev/nvme0n1p4 /mnt";

    const sub_volume_root = "btrfs su cr /mnt/@";
    const sub_volume_snapshots = "btrfs su cr /mnt/@snapshots";

    const umount = "umount /mnt";

    const r_mount = "mount -t btrfs -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/nvme0n1p4 /mnt";

    const mkdir_snapshots = "mkdir -p /mnt/.snapshots";

    const r_mount_snapshots = "mount -t btrfs -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots /dev/nvme0n1p4 /mnt/.snapshots";
}

{ // home
    const mkdir = "mkdir -p /mnt/home";
    const mount = "mount /dev/nvme0n1p5 /mnt/home";
}

{ // boot
    const mkdir = "mkdir -p /mnt/boot";
    const mount = "mount /dev/nvme0n1p2 /mnt/boot";

    { // efi
        const mkdir = "mkdir -p /mnt/boot/efi";
        const mount = "mount /dev/nvme0n1p1 /mnt/boot/efi";
    }
}

{ // gerekli dosyaları kopyala

}

/*

apt update
///apt ugrade

apt install exfatprogs exfat-utils -y
apt install debootstrap genfstab -y
apt install btrfs-progs zfsutils-linux zfs-initramfs zfs-dkms -y

apt install linux-image-generic grub-efi-amd64 -y

systemctl start zfs-zed.service
modprobe zfs





*/


{ // temel kurulum
    const cmd = "debootstrap mantic /mnt";

    const copy_file_1 = "sudo cp -r ./_root/* /mnt";
    const copy_file_2 = "sudo cp ./_files/sources.list /mnt/etc/apt/";
    const copy_file_3 = "sudo cp ./_files/resolv.conf /mnt/etc/apt/";

    const mkdir_etc = "mkdir -p /mnt/etc";
    const mkdir_dev = "mkdir -p /mnt/dev";
    const mkdir_sys = "mkdir -p /mnt/sys";
    const mkdir_proc = "mkdir -p /mnt/proc";

    const bind_sys = "mount --rbind /sys /mnt/sys && mount --make-rslave /mnt/sys";
    const bind_dev = "mount --rbind /dev /mnt/dev && mount --make-rslave /mnt/dev";
    const bind_proc = "mount --rbind /proc /mnt/proc && mount --make-rslave /mnt/proc";

    const update = "sudo chroot /mnt apt update";
    const install_kernel = "sudo chroot /mnt apt install grub-efi-amd64 linux-image-generic -y";

    const import_code = "sudo chroot /mnt sh /setup/inner_install.sh";

    // apt install grub-efi-amd64

    const install_bootloader = "grub-install /dev/nvme0n1";
}

{

}





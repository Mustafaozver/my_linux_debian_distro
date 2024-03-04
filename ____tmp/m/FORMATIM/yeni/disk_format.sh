
fdisk /dev/nvme0n1

blkid
/dev/nvme0n1p5: UUID="256da897-946e-48fa-b8d7-0428643fd8a0" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="da577265-78e7-462d-baca-ca621046addb"
/dev/nvme0n1p3: UUID="e5887928-472e-4564-b4fd-15e23e5e0b70" TYPE="swap" PARTUUID="07b55ea1-e283-4f0b-9836-e0316aa72b8c"
/dev/nvme0n1p1: SEC_TYPE="msdos" UUID="D83B-C3A7" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="86ade9ae-6424-4268-a515-9255b9cd79de"
/dev/nvme0n1p6: UUID="D88B-8B98" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="8d782f3b-ecb5-489d-881f-4b91920ae9e7"
/dev/nvme0n1p4: UUID="60fb8bc8-3072-443a-97a6-3ad6539dae71" UUID_SUB="00b30cf3-fc61-41da-8e7b-25b33c889835" BLOCK_SIZE="4096" TYPE="btrfs" PARTUUID="27507e09-bcea-4a62-bccd-eee5b04736ec"
/dev/nvme0n1p2: UUID="d28d2c50-e987-448e-bc13-e37439cbaa5f" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="bd2a58b5-dff4-4d7f-8707-8db9ac62b972"


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




mkswap /dev/nvme0n1p3
swapon /dev/nvme0n1p3
mkfs.vfat /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkfs.btrfs /dev/nvme0n1p4
mkfs.ext4 /dev/nvme0n1p5
mkfs.vfat /dev/nvme0n1p6






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


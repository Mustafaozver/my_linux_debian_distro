debootstrap mantic /mnt

for dir in sys dev proc ; do mount --rbind /$dir /mnt/$dir && mount --make-rslave /mnt/$dir ; done



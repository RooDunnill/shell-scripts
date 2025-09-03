#!/bin/bash


MNT_PNT="/mnt/raid-backup"

SMB_SHARE="//192.168.0.90/RAID"


read -s -p "Enter Samba PassWD:" SMB_PASSWD
echo

sudo mkdir -p "$MNT_PNT"

sudo mount -t cifs //192.168.0.90/RAID /mnt/raid-backup -o username=olorin,password='$SMB_PASSWD',uid=$(id -u),gid=$(id -g)


if mountpoint -q "$MNT_PNT"; then
    echo "Mount Successful"
else
    echo "Mount Failed"
fi

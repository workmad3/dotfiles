#!/bin/bash
NAME="RamDisk"
SIZE_MB=2
SIZE=$(( $SIZE_MB * 2048 ))
while [ ! -d /Volumes ]
do
    echo "waiting..."
    sleep 2
done
if [ ! -d /Volumes/$NAME ]; then
    echo "creating ramdisk..."
    diskutil erasevolume HFS+ $NAME `hdiutil attach -nomount ram://$SIZE`
fi

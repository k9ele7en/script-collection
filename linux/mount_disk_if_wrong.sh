## if error like mount: /mnt: wrong fs type, bad option, bad superblock on /dev/sdb, missing codepage or helper program, or other error.
# create mount dir
sudo mkdir /hdd6T

# new file system
sudo mkfs.ext4 /dev/sdc

# mount drive
sudo mount /dev/sdc /hdd6T/

# change ownership to specified user
sudo chown your-user /hdd6T/
# list timezone
timedatectl list-timezones

# set
sudo timedatectl set-timezone Asia/Bangkok

# update time date
sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"

##verify gpu-device
lspci | grep -i nvidia
##verify linux OS
uname -m && cat /etc/*release

##verify gcc
# gcc --version
## install gcc
sudo apt update
sudo apt install build-essential

## install cuda 

## Debian 10
wget https://developer.download.nvidia.com/compute/cuda/11.4.3/local_installers/cuda_11.4.3_470.82.01_linux.run
sudo sh cuda_11.4.3_470.82.01_linux.run

## Debian 11, Ubuntu
wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda_11.6.2_510.47.03_linux.run
sudo sh cuda_11.6.2_510.47.03_linux.run

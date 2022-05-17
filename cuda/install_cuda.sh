#### Prepare
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
###By run file
## Debian 10
wget https://developer.download.nvidia.com/compute/cuda/11.4.3/local_installers/cuda_11.4.3_470.82.01_linux.run
sudo sh cuda_11.4.3_470.82.01_linux.run

## Debian 11, Ubuntu
wget https://developer.download.nvidia.com/compute/cuda/11.6.2/local_installers/cuda_11.6.2_510.47.03_linux.run
sudo sh cuda_11.6.2_510.47.03_linux.run


###By apt file
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/ /"
sudo add-apt-repository contrib

##if update fail bc key not found then https://developer.nvidia.com/blog/updating-the-cuda-linux-gpg-repository-key/
sudo apt-get update
sudo apt-get -y install cuda


######Uninstall clean
sudo apt-get remove --purge '^nvidia-.*'
sudo apt-get remove --purge '^libnvidia-.*'
sudo apt-get remove --purge '^cuda-.*'
sudo apt-get --purge remove "*cuda*" "*cublas*" "*cufft*" "*cufile*" "*curand*" \
 "*cusolver*" "*cusparse*" "*gds-tools*" "*npp*" "*nvjpeg*" "nsight*" 
# To remove NVIDIA Drivers:
sudo apt-get --purge remove "*nvidia*"
# To clean up the uninstall:
sudo apt-get autoremove
# To uninstall the CUDA Toolkit, run the uninstallation script provided in the bin directory of the toolkit. By default, it is located in /usr/local/cuda-11.7/bin:
sudo /usr/local/cuda-11.7/bin/cuda-uninstaller
# To uninstall the NVIDIA Driver, run nvidia-uninstall:
sudo /usr/bin/nvidia-uninstall

##if The issue was started after did some updates, and the Linux kernel was changed.
sudo apt-get install linux-headers-$(uname -r)

##then try again installing by .run file or apt...


###if run docker with gpus, install nvidia-docker2
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker


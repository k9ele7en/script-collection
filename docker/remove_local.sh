# filter by image name, tag diferrent than grep -v, ex: latest
sudo docker rmi $(sudo docker images -q --filter=reference='image-name' |grep -v 'latest')

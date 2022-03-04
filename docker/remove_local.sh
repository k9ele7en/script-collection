# filter by image name, tag diferrent than grep -v, ex: latest
sudo docker rmi $(sudo docker images -q --filter=reference='image-name' |grep -v 'latest')

#According to the docker documentation you can list only untagged (dangling) images with

docker images -f "dangling=true"
#and redirect them to docker rmi command like that:

docker rmi $(docker images -f "dangling=true" -q) --force
#Notice -q param thats only show numeric IDs of containers.

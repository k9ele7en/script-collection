# as guide in https://access.redhat.com/discussions/6249651
# "the repourl is wrong. The dockerrepo only provides "centos" (not rhel) as distribution. The correct repomd.xml URL is https://download.docker.com/linux/centos/8/x86_64/stable/repodata/repomd.xml"
sudo vi /etc/yum.repos.d/docker-ce.repo

paste below text:
###
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/centos/$releasever/$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg
###

sudo yum install docker-ce docker-ce-cli containerd.io
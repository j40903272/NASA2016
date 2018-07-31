#!/bin/bash
sudo virt-install \
	--name $1 \
	--virt-type kvm \
	--ram 1024 \
	--vcpus=2 \
	--disk path=/data/vm-images/b04902103/$1,size=16 \
	--os-type=linux \
	--network bridge=br2 \
	--graphics none \
	--accelerate \
	--console pty,target_type=serial \
	--location /media/iso/CentOS-7-x86_64-Minimal-1611.iso \
	--extra-args 'console=ttyS0,115200n8 serial ks=/home/b04902103/ks.cfg'

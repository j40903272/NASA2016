# virt-install \
-n rhel7ks-guest \
-r 1024 \
--file=/var/lib/libvirt/images/rhel7ks-guest.img \
--file-size=10 \
--location /var/lib/libvirt/images/rhel-server-7.1-x86_64-dvd.iso \
--nographics \
--extra-args="ks=http://192.168.122.1/ks.cfg ip=dhcp \
console=tty0 console=ttyS0,115200n8" --os-variant=rhel7.0
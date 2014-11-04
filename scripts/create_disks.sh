#!/bin/bash

disk_number=$1
disk_size=$2
server_name=$3

if [ "$disk_number" == '' ] || [ "$disk_size" == '' ] || [ "$server_name" == '' ];then
	echo "example: $0 5 2000 ceph  <would create 5 disks at 2Gs on server ceph>"
else
  server_uuid=`vboxmanage showvminfo ceph --machinereadable |grep UUID= |awk -F '=' '{print $2}'|sed 's/"//g'`
  echo "Creating $disk_number disks of size $disk_size"
  for i in $(seq 1 $disk_number);do
    echo "creating disk test_disk$i"
    VBoxManage createhd --filename test_disk$i.vdi --size $disk_size --format VDI
  done

  for i in $(seq 1 $disk_number);do
    echo "Attaching disk test_disk$i to server $server_name..."
    VBoxManage storageattach $server_uuid --storagectl "SATA Controller" --port $i --device 0 --type hdd --medium test_disk$i.vdi
  done
fi

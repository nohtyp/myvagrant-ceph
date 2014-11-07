require 'facter'
#This fact will get back all unused disks to use for provisioning a ceph node.

Facter::Util::Resolution.exec('lsblk -n -d -e 11,1').scan(/sd\D+/).each do |disk|
  disk = disk.strip!
  if disk.nil?
  else
    in_use = Facter::Util::Resolution.exec('mount')
    disk.each do |not_found|
      if !in_use.include?(not_found)
        Facter.add("unused_disk_#{disk}") do
          setcode do
            disk
          end
        end
      end
    end
  end
end

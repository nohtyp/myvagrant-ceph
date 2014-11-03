require 'facter'
#
Facter::Util::Resolution.exec('lsblk -n -d -e 11,1').scan(/sd\D+/).each do |disk|
  disk = disk.strip!
  in_use = Facter::Util::Resolution.exec('mount').include?(disk)
  if !in_use
    Facter.add("unused_disk_#{disk}") do
      setcode do
        disk
      end
    end
  end
end

require 'facter'
#
Facter::Util::Resolution.exec('lsblk -n -d -e 11,1').scan(/(sd\D+)/).each do |disks|
  is_used = Facter::Util::Resolution.exec('mount').scan("#{disks}".strip)
  if is_used.empty?
    Facter.add("unused_disk_#{disks}".strip) do
      setcode do
        disks
      end
    end
  end
end

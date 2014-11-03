require 'facter'
#
#
def mydevice(device)
  num = 0
  is_used = Facter::Util::Resolution.exec('mount').scan("#{device}")
  if is_used.empty? 
    num += 1
    Facter.add("unused_disk#{num}") do
      setcode do
        device
      end
    end
  end
end

disks = Facter::Util::Resolution.exec('lsblk -n -d -e 11,1').scan(/(sd.)/)
disks.each { |x| mydevice(x) }

require 'facter'
# This fact will determine if a cluster exists.  If cluster exists you will be able to add osd's to cluster using the name.  This should also provide clusters that exist on which servers and monitor hosts.  This fact should not be used with clusters with numbers in them...I was lazy in trying to figure out the regex for it (wanted to get it done).  Unless someone wants to come up with the regex to fix the problem, please submit a pull request.
#
Facter::Util::Resolution.exec(grep -R fsid /etc/ceph/).each do |cluster|
  #if cluster.nil?
  #else
  #  mycluster_fsid = cluster.split(':')
  #  if mycluster_fsid[0].nil? or mycluster_fsid[1].nil?
  #  else
  #    Facter.add("#{mycluster_fsid[0]}_cluster") do
  #      setcode do
  #        "#{mycluster_fsid[1]}"
#	end
##      end
#    end
#  end
cluster
end

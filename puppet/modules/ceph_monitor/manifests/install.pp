class ceph_monitor::install inherits ceph_monitor {
  
  package { 'ceph-deploy':
    ensure => $package_ensure,
  }
}

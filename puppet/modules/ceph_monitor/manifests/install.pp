class ceph_monitor::install inherits ceph_monitor {
  
  package { 'ceph':
    ensure => $package_ensure,
  }
}

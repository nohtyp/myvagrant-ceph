class ceph::install inherits ceph {
  
  package { 'ceph':
    ensure => $package_ensure,
  }
}

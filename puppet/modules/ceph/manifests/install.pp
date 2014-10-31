class ceph::install inherits ceph {
  
  package { 'ceph-release':
    ensure => $package_ensure,
  }
}

class ceph::install inherits ceph {
  
  package { 'ceph-deploy':
    ensure => $package_ensure,
  }
}

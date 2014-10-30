class ceph_deploy_node::install inherits ceph_deploy_node {
  
  package { 'ceph-deploy':
    ensure => $package_ensure,
  }
}

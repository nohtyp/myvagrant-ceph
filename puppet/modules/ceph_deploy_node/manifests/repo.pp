class ceph_deploy_node::repo inherits ceph_deploy_node {

  yumrepo { $file_name:
    descr    => $ceph_descr,
    baseurl  => $ceph_baseurl,
    enabled  => $yum_enabled,
    gpgcheck => $check_gpg,
    gpgkey   => $gpg_key,
  }
}


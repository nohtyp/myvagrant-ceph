class ceph_monitor::repo inherits ceph_monitor {

  yumrepo { $file_name:
    descr    => $ceph_descr,
    baseurl  => $ceph_baseurl,
    enabled  => $yum_enabled,
    gpgcheck => $check_gpg,
    gpgkey   => $gpg_key,
  }
}

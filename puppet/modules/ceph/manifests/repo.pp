class ceph::repo inherits ceph {

  yumrepo { $file_name:
    descr    => $ceph_descr,
    baseurl  => $ceph_baseurl,
    enabled  => $yum_enabled,
    gpgcheck => $check_gpg,
    gpgkey   => $gpg_key,
  }
  yumrepo { $file_name_noarch:
    descr    => $ceph_descr_noarch,
    baseurl  => $ceph_baseurl_noarch,
    enabled  => $yum_enabled,
    gpgcheck => $check_gpg,
    gpgkey   => $gpg_key,
  }
}


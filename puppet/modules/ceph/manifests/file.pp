class ceph::file inherits ceph {

  file { $user_dir:
    ensure  => $dir_ensure,
    owner   => $ceph_owner,
    group   => $ceph_group,
    mode    => $ceph_mode,
    require => User[$ceph_user],
  }
}

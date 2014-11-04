class ceph_monitor::file inherits ceph_monitor {

  file { $user_home:
    ensure  => $dir_ensure,
    owner   => $ceph_user,
    group   => $ceph_group,
    mode    => $ceph_mode,
    require => User[$ceph_user],
  }
}

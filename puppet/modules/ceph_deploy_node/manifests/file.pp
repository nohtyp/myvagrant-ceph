class ceph_deploy_node::file inherits ceph_deploy_node {

  file { $user_home:
    ensure  => $dir_ensure,
    owner   => $ceph_user,
    group   => $ceph_group,
    mode    => $ceph_mode,
    require => User[$ceph_user],
  }
}

class ceph::user inherits ceph {

  user { 'ceph_user':
    ensure           => $user_status,
    name             => $ceph_user,
    uid              => $uid,
    gid              => $gid,
    home             => $user_home,
    password         => $user_pw,
    password_max_age => $max_pw_age,
    password_min_age => $min_pw_age,
    managehome       => $manage_home,
    shell            => $user_shell,
    system           => $is_system_account,
    require          => Group['ceph_group'],
  }

  group { 'ceph_group':
  ensure    => $group_status,
  name      => $ceph_group,
  gid       => $ceph_gid,
  }
}


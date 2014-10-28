class ceph::require-tty inherits ceph {

  file_line { 'no_tty_for_ceph_user':
    path  => $sudo_file,
    line  => $sudo_rule,
  }
}

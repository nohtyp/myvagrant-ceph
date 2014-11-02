class ceph::require-tty inherits ceph {

  file { $sudo_d_file:
    ensure  => $sudo_file,
    content => "$sudo_content \n",
  }
}

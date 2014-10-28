class ceph::ssh-key inherits ceph {

  ssh_authorized_key { $sshkey_location:
    ensure  => $ensure_sshkey,
    user    => $ceph_user,
    name    => $servername,
    key     => $ssh_key,
    type    => $sshkey_type,
    require => User[$ceph_user],
  }
}

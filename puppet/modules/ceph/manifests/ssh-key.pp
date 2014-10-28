class ceph::ssh-key inherits ceph {

  sshkey { $sshkey_location:
    ensure  => $ensure_sshkey,
    name    => $servername,
    key     => $ssh_key,
    type    => $sshkey_type,
  }
}

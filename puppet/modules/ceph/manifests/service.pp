class ceph::service inherits ceph {

  service { 'ceph_daemons':
    ensure    => $ceph_service,
    enable    => $is_enabled,
    hasrestart => true,
    hasstatus  => true,
  }
}

node 'ceph.familyguy.com' {
  include profile::cnode
}
node 'ceph1.familyguy.com' {
  include profile::cnode
}
node 'ceph-monitor.familyguy.com' {
  include profile::cmonitor
}


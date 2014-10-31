node 'ceph.familyguy.com' {
  include profile::cnode
}
node 'ceph-deploy.familyguy.com' {
  include profile::deploy_node
}


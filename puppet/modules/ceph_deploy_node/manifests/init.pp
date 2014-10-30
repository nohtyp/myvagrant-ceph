# == Class: ceph
#
# Full description of class ceph here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ceph:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class ceph_deploy_node ( 
  
  $package_ensure          = $ceph_deploy_node::params::package_ensure,
  $ceph_descr              = $ceph_deploy_node::params::ceph_descr,
  $file_name               = $ceph_deploy_node::params::file_name,
  $ceph_baseurl            = $ceph_deploy_node::params::ceph_baseurl,
  $yum_enabled             = $ceph_deploy_node::params::yum_enabled,
  $gpgcheck                = $ceph_deploy_node::params::check_gpg,
  $servername              = $ceph_deploy_node::params::servername,
  $user_status             = $ceph_deploy_node::params::user_status,
  $ceph_user               = $ceph_deploy_node::params::ceph_user,
  $uid                     = $ceph_deploy_node::params::uid,
  $ceph_group              = $ceph_deploy_node::params::ceph_group,
  $group_status            = $ceph_deploy_node::params::group_status,
  $ceph_gid                = $ceph_deploy_node::params::ceph_gid,
  $user_home               = $ceph_deploy_node::params::user_home,
  $user_pw                 = $ceph_deploy_node::params::user_pw,
  $max_pw_age              = $ceph_deploy_node::params::max_pw_age,
  $min_pw_age              = $ceph_deploy_node::params::min_pw_age,
  $manage_home             = $ceph_deploy_node::params::manage_home,
  $purge_keys              = $ceph_deploy_node::params::purge_keys,
  $user_shell              = $ceph_deploy_node::params::user_shell,
  $is_system_account       = $ceph_deploy_node::params::is_system_account,
  $ceph_group              = $ceph_deploy_node::params::ceph_group,
  $ceph_mode               = $ceph_deploy_node::params::ceph_mode,
) inherits ceph_deploy_node::params {


  anchor {'ceph_deploy_node::begin': } ->
    class {'::ceph_deploy_node::repo':} ->
    class {'::ceph_deploy_node::install':} ->
    class {'::ceph_deploy_node::user':} ->
  anchor {'ceph_deploy_node::end':}
}

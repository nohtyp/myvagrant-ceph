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
class ceph_monitor ( 
  
  $package_ensure          = $ceph_monitor::params::package_ensure,
  $ceph_descr              = $ceph_monitor::params::ceph_descr,
  $file_name               = $ceph_monitor::params::file_name,
  $ceph_baseurl            = $ceph_monitor::params::ceph_baseurl,
  $yum_enabled             = $ceph_monitor::params::yum_enabled,
  $gpgcheck                = $ceph_monitor::params::check_gpg,
  $servername              = $ceph_monitor::params::servername,
  $user_status             = $ceph_monitor::params::user_status,
  $ceph_user               = $ceph_monitor::params::ceph_user,
  $uid                     = $ceph_monitor::params::uid,
  $ceph_group              = $ceph_monitor::params::ceph_group,
  $group_status            = $ceph_monitor::params::group_status,
  $ceph_gid                = $ceph_monitor::params::ceph_gid,
  $user_home               = $ceph_monitor::params::user_home,
  $user_pw                 = $ceph_monitor::params::user_pw,
  $max_pw_age              = $ceph_monitor::params::max_pw_age,
  $min_pw_age              = $ceph_monitor::params::min_pw_age,
  $manage_home             = $ceph_monitor::params::manage_home,
  $purge_keys              = $ceph_monitor::params::purge_keys,
  $user_shell              = $ceph_monitor::params::user_shell,
  $is_system_account       = $ceph_monitor::params::is_system_account,
  $ceph_group              = $ceph_monitor::params::ceph_group,
  $ceph_mode               = $ceph_monitor::params::ceph_mode,
) inherits ceph_monitor::params {


  anchor {'ceph_monitor::begin': } ->
    class {'::ceph_monitor::repo':} ->
    class {'::ceph_monitor::install':} ->
    class {'::ceph_monitor::user':} ->
  anchor {'ceph_monitor::end':}
}

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
class ceph ( 
  
  $package_ensure          = $ceph::params::package_ensure,
  $ensure_repo             = $ceph::params::ensure_repo,
  $ceph_descr              = $ceph::params::ceph_descr,
  $ceph_descr_noarch       = $ceph::params::ceph_descr_noarch,
  $file_name               = $ceph::params::file_name,
  $file_name_noarch        = $ceph::params::file_name_noarch,
  $ceph_baseurl            = $ceph::params::ceph_baseurl,
  $ceph_baseurl_noarch     = $ceph::params::ceph_baseurl_noarch,
  $yum_enabled             = $ceph::params::yum_enabled,
  $gpgcheck                = $ceph::params::check_gpg,
  $gpg_key                 = $ceph::params::gpg_key,
  $sudo_file               = $ceph::params::sudo_file,
  $sudo_d_file             = $ceph::params::sudo_d_file,
  $sudo_content            = $ceph::params::sudo_content,
  $ensure_sshkey           = $ceph::params::ensure_sshkey,
  $servername              = $ceph::params::servername,
  $ssh_key                 = $ceph::params::ssh_key,
  $sshkey_location         = $ceph::params::sshkey_location,
  $sshkey_type             = $ceph::params::sshkey_type,
  $user_status             = $ceph::params::user_status,
  $ceph_user               = $ceph::params::ceph_user,
  $uid                     = $ceph::params::uid,
  $gid                     = $ceph::params::gid,
  $ceph_gid                = $ceph::params::ceph_gid,
  $group_status            = $ceph::params::group_status,
  $ceph_group              = $ceph::params::ceph_group,
  $user_home               = $ceph::params::user_home,
  $user_pw                 = $ceph::params::user_pw,
  $max_pw_age              = $ceph::params::max_pw_age,
  $min_pw_age              = $ceph::params::min_pw_age,
  $manage_home             = $ceph::params::manage_home,
  $purge_keys              = $ceph::params::purge_keys,
  $user_shell              = $ceph::params::user_shell,
  $is_system_account       = $ceph::params::is_system_account,
  $user_dir                = $ceph::params::user_dir,
  $dir_ensure              = $ceph::params::dir_ensure,
  $ceph_owner              = $ceph::params::ceph_owner,
  $ceph_mode               = $ceph::params::ceph_mode,
) inherits ceph::params {


  anchor {'ceph::begin': } ->
    class {'::ceph::repo':} ->
    class {'::ceph::install':} ->
    class {'::ceph::user':} ->
    class {'::ceph::ssh-key':} ->
    class {'::ceph::require-tty':} ->
  anchor {'ceph::end':}
}

class ceph_monitor::params {

  $ceph_release = 'firefly'
  $distro       = 'el6'
  $arch         = "${::architecture}"


  case $::osfamily {
    'RedHat': {
      $pacakge_ensure       = 'installed'
      $ensure_repo          = 'present'
      $ceph_descr           = 'This repo will host the ceph rpms'
      $ceph_descr_noarch    = 'This repo will host the ceph noarch rpms'
      $file_name            = 'ceph'
      $file_name_noarch     = 'ceph-noarch'
      $ceph_baseurl         = "http://ceph.com/rpm-$ceph_release/$distro/$arch"
      $ceph_baseurl_noarch  = "http://ceph.com/rpm-$ceph_release/$distro/noarch"
      $yum_enabled          = '1'
      $gpgcheck             = true
      $gpg_key              = 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc'
      $user_status          = 'present'
      $ceph_user            = 'ceph'
      $uid                  = '600'
      $ceph_gid             = '600'
      $group_status         = 'present'
      $ceph_group           = 'ceph'
      $user_home            = '/home/ceph'
      $user_pw              = 'new.one'
      $max_pw_age           = '-1'
      $min_pw_age           = '-1'
      $manage_home          = true
      $purge_keys           = true
      $user_shell           = '/bin/bash'
      $is_system_account    = false
      $dir_ensure           = 'present'
      $ceph_mode            = '0700'
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}

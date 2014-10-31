class ceph::params {

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
      $sudo_file            = '/etc/sudoers'
      $sudo_rule            = 'Defaults:ceph !requiretty'
      $ensure_sshkey        = 'present'
      $servername           = 'ceph@aeacus.nesdis-hq.noaa.gov'
      $ssh_key              = 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCroYlHZW3Ck2VLaEEGmVNdz9tE8UUKEja7wpi4nXt7lTQK0eKcAtSUkE+j68PgnFYkKooTK28NMTG/RZd6PGPRI3uWzthHl43Wg1yeZSiOBoEIpXivCl4ebHnADnDqoEl5GNFDVghGupKd7RdZjiMzBBUUUf60EZtfphOfstwgQJyfIkKrwB/CuVypJ9LxpUTTtWvdrZD400B2VNdj+vCBBJpizCXtiB0fUDmjm8PHMyaCb0go53Fb5KhWGI/SZSqPbsRu9L8MaS6Gss0zasswQ56OSmUHwIsyQaWBRguHhdugwGh40dj0hIBVBXcb3iRKjpCGkOX7Ov5G2V/Mk1TJ'
      $sshkey_location      = '/home/ceph/.ssh/authorized_keys'
      $sshkey_type          = 'ssh-rsa'
      $user_status          = 'present'
      $ceph_user            = 'ceph'
      $uid                  = '600'
      $gid                  = '600'
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
      $user_dir             = '/home/ceph'
      $dir_ensure           = 'present'
      $ceph_owner           = 'ceph'
      $ceph_mode            = '0700'
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}

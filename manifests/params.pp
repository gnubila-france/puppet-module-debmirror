#
# Class: debmirror::params
#
#   The debmirror configuration settings.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class debmirror::params {

  # debmirror::package

  $package_name = $::operatingsystem ? {
    /debian|Ubuntu/ => 'debmirror',
    default         => undef,
  }

  $package_ensure = $::operatingsystem ? {
    /debian|Ubuntu/ => 'installed',
    default         => undef,
  }

  # debmirror::package

  $user_ensure   = 'present'
  $user_name     = 'mirror'
  $user_password = undef
  $user_home     = '/srv/mirror'
  $user_shell    = '/bin/bash'
  $user_group    = 'mirror'
  $user_group_id = undef
  $user_uid      = undef

  # debmirror::mirror

  $mirror_path                   = undef
  $mirror_user                   = 'root'
  $mirror_group                  = 'root'
  $mirror_method                 = 'http'
  $mirror_host                   = $::operatingsystem ? {
    debian => 'ftp.debian.org',
    Ubuntu => 'archive.ubuntu.com',
  }
  $mirror_rootdir                = $::operatingsystem ? {
    debian => 'debian',
    Ubuntu => 'ubuntu',
  }
  $mirror_dists                  = $::operatingsystem ? {
    debian => 'wheezy',
    Ubuntu => 'trusty',
  }
  $mirror_sections               = $::operatingsystem ? {
    debian => 'main,contrib,non-free',
    Ubuntu => 'main,universe,multiverse',
  }
  $mirror_arch                   = 'i386,amd64'
  $mirror_di_dist                = undef
  $mirror_di_arch                = undef
  $mirror_getsources             = false
  $mirror_getcontents            = false
  $mirror_md5sums                = false
  $mirror_diff                   = undef
  $mirror_i18n                   = false
  $mirror_timeout                = undef
  $mirror_passive                = undef
  $mirror_proxy                  = undef
  $mirror_remoteusername         = undef
  $mirror_remoteuserpassword     = undef
  $mirror_rsync_extra            = undef
  $mirror_rsync_options          = undef
  $mirror_ignore_missing_release = undef
  $mirror_ignore_release_pgp     = undef
  $mirror_omitsuitesymlinks      = undef
  $mirror_postcleanup            = undef
  $mirror_cleanup                = undef
  $mirror_log                    = undef

}

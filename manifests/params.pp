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
    debian  => 'debmirror',
    default => undef,
  }

  $package_ensure = $::operatingsystem ? {
    debian  => 'installed',
    default => undef,
  }

  # debmirror::package

  $user_ensure   = 'present'
  $user_name     = 'mirror'
  $user_password = undef
  $user_home     = '/srv/mirror'
  $user_shell    = '/bin/bash'
  $user_group    = 'mirror'

  # debmirror::mirror

  $mirror_path                   = undef
  $mirror_user                   = 'root'
  $mirror_group                  = 'root'
  $mirror_method                 = 'http'
  $mirror_host                   = 'ftp.debian.org'
  $mirror_rootdir                = 'debian'
  $mirror_dists                  = 'squeeze'
  $mirror_sections               = 'main,contrib,non-free'
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
  $mirror_ignore_missing_release = undef
  $mirror_ignore_release_pgp     = undef
  $mirror_omitsuitesymlinks      = undef
  $mirror_postcleanup            = undef
  $mirror_cleanup                = undef

}

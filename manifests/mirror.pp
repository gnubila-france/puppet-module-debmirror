#debmirror::mirror { 'debian':
#  method      => 'http',
#  host        => 'mirror.admin.private',
#  dists       => [ 'squeeze' , 'squeeze-updates' ],
#  sections    => [ 'main' , 'contrib' , 'non-free' , 'updates' ],
#  arch        => [ 'i386' , 'amd64' ],
#  source      => true,
#  getcontents => true,
#  user        => 'mirror'
#  group       => 'mirror'
#  path        => '/srv/mirror/debian'
#}

define debmirror::mirror (
  $path,
  $user                   = $debmirror::params::mirror_user,
  $group                  = $debmirror::params::mirror_group,
  $method                 = $debmirror::params::mirror_method,
  $host                   = $debmirror::params::mirror_host,
  $rootdir                = $debmirror::params::mirror_rootdir,
  $dists                  = $debmirror::params::mirror_dists,
  $sections               = $debmirror::params::mirror_sections,
  $arch                   = $debmirror::params::mirror_arch,
  $di_dist                = $debmirror::params::mirror_di_dist,
  $di_arch                = $debmirror::params::mirror_di_arch,
  $getsources             = $debmirror::params::mirror_getsources,
  $getcontents            = $debmirror::params::mirror_getcontents,
  $md5sums                = $debmirror::params::mirror_md5sums,
  $diff                   = $debmirror::params::mirror_diff,
  $i18n                   = $debmirror::params::mirror_i18n,
  $timeout                = $debmirror::params::mirror_timeout,
  $passive                = $debmirror::params::mirror_passive,
  $proxy                  = $debmirror::params::mirror_proxy,
  $remoteusername         = $debmirror::params::mirror_remoteusername,
  $remoteuserpassword     = $debmirror::params::mirror_remoteuserpassword,
  $rsync_extra            = $debmirror::params::mirror_rsync_extra,
  $rsync_options          = $debmirror::params::mirror_rsync_options,
  $ignore_missing_release = $debmirror::params::mirror_ignore_missing_release,
  $ignore_release_pgp     = $debmirror::params::mirror_ignore_release_pgp,
  $omitsuitesymlinks      = $debmirror::params::mirror_omitsuitesymlinks,
  $postcleanup            = $debmirror::params::mirror_postcleanup,
  $cleanup                = $debmirror::params::mirror_cleanup,

) {

  include debmirror::params

  if ( $path == undef ) { fail("You must provide a path") }

  file { "$path":
    ensure => directory,
    owner  => $user,
    group  => $group,
    mode   => '0755'
  }

  file { "/etc/cron.daily/debmirror-${name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('debmirror/mirror.cron.erb'),
  }


}

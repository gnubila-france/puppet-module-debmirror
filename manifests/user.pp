# Class: debmirror::user
#
#   This class manage the mirror user.
#
# Parameters:
#   [*user_ensure*]   - The status of the debmirror user (present,absent).
#   [*user_name*]     - The name of the debmirror user.
#   [*user_password*] - The password for the debmirror user.
#   [*user_home*]     - The home directory for the debmirror user.
#   [*user_shell*]    - The shell for the debmirror user.
#   [*user_group_id*] - The group numerical ID for the debmirror user.
#   [*user_group*]    - The group for the debmirror user.
#   [*user_uid*]      - The user numerical ID for the debmirror user.
#
# TODO: Manage following parameters
#   - user_password_disabled
#   - user_manage_home
#   - user_manage group
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class debmirror::user (

  $user_ensure   = $debmirror::params::ensure,
  $user_name     = $debmirror::params::user_name,
  $user_password = $debmirror::params::user_password,
  $user_home     = $debmirror::params::user_home,
  $user_shell    = $debmirror::params::user_shell,
  $user_group    = $debmirror::params::user_group,
  $user_group_id = $debmirror::params::user_group_id,
  $user_uid      = $debmirror::params::user_uid,

) inherits debmirror::params {

  user { "${user_name}":
    ensure   => "${user_ensure}",
    system   => true,
    gid      => "${user_group}",
    home     => "${user_home}",
    password => "${user_password}",
    uid      => "${user_uid}",
  }

  group { "${user_group}":
    ensure => present,
    system => true,
    gid    => "${user_group_id}",
  }

  file { "${user_home}":
    ensure => directory,
    owner  => "${user_name}",
    group  => "${user_group}",
    mode   => '0755',
  }

}

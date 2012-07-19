# Class: debmirror
#
#   This class installs debmirror package.
#
# Parameters:
#   [*package_ensure*] - The desired state for the debmirror server package.
#   [*package_name*] - The name of the debmirror server package.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class debmirror (

  $package_name      = $debmirror::params::package_name,
  $package_ensure    = $debmirror::params::package_ensure,

) inherits debmirror::params {

  class { 'debmirror::package' :
    package_name   => $package_name,
    package_ensure => $package_ensure,
  }

  #class { 'debmirror::user' :
  #  ensure   => $user_ensure,
  #  name     => $user_name,
  #  password => $user_password,
  #  home     => $user_home,
  #  shell    => $user_shell,
  #  group    => $user_group,
  #}

}

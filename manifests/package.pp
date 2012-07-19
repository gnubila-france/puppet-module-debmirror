# Class: debmirror::package
#
#   This class installs debmirror package.
#
# Parameters:
#   [*package_ensure*] - The desired state for the debmirror package.
#   [*package_name*] - The name of the debmirror package.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class debmirror::package (

  $package_ensure = $debmirror::params::package_ensure,
  $package_name   = $debmirror::params::package_name

) inherits debmirror::params {

  if ( $package_ensure == undef ) {
    fail('Package ensure is missing.')
  }

  if ( $package_name == undef ) {
    fail('Package name is missing.')
  }

  package { 'debmirror':
    ensure  => $package_ensure,
    name    => $package_name,
  }

}


# debmirror

This module manage the debmirror software

## Usage

  include debmirror

or

  class { 'debmirror': }

### Example

  class { "debmirror": }
  
  debmirror::mirror { 'debian':
    path                   => '/srv/mirror/debian',
    user                   => 'mirror',
    group                  => 'mirror',
    method                 => 'http',
    host                   => 'cdn.debian.org',
    rootdir                => 'debian',
    dists                  => 'squeeze,squeeze-updates',
    sections               => 'main,contrib,non-free',
    arch                   => 'i386,amd64',
    getsources             => true,
    getcontents            => true,
    i18n                   => true,
    diff                   => 'none',
    ignore_missing_release => true,
    ignore_release_pgp     => true,
  }

## Additional class parameters for debmirror

* package_ensure : The desired state for the debmirror client package.
* package_name   : The name of the debmirror client package.

## Additional class parameters for debmirror::mirror

* path
* user
* group
* method
* host
* rootdir
* dists
* sections
* arch
* getsources
* getcontents
* i18n
* diff
* ignore_missing_release
* ignore_release_pgp

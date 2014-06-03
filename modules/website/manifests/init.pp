# == Class: website
#
# Base class installs websites to /var/www
# from GIT repository
#
# === Parameters
#
# [*site_name*]
#   (string) Website's name, determines site's DocRoot
#   Required ($::website::site_name)
#
# [*git_source*]
#   (string) Location of upsream site GIT repository
#   Defaults to undef ($::website::git_source)
#
# [*manage_git*]
#   (bool) If true, require the git package. If false do nothing.
#   Defaults to false
#

class website(
  $site_name,
  $git_source = undef,
  $manage_git = false,
) {

  include nginx

  $site_root = "/var/www/${site_name}"

  file { ['/var/www', $site_root]:
    ensure => directory,
  }

  if $git_source {
    vcsrepo { $site_root:
      ensure   => present,
      provider => git,
      owner    => $nginx::user,
      source   => $git_source,
    }
  } else {
    notify { 'git repo site not provided. Make sure to install website files yourself': }
  }

  if $manage_git {
    package { 'git':
      ensure => installed,
    }
  }

  nginx::vhost { $site_name:
    docroot => $site_root,
  }
}

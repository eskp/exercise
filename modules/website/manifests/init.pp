# == Class: website
#
# Base class to get website's files onto a server
#
# === Parameters
#
# [*basedir*]
#   (string) Base directory where to build site vcsrepo
#   Defaults to '/var/www/html' ($::website::basedir)
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
  $basedir = '/var/www/html',
  $git_source = undef,
  $manage_git = false,
) {

  include nginx

  file { '/var/www':
    ensure => directory,
  }

  if $git_source {
    vcsrepo { $basedir:
      ensure   => present,
      provider => git,
      owner    => $nginx::user,
      source   => $git_source,
    }
  } else {
    notify { 'git repo address not provided. Make sure to install site files yourself': }
  }

  if $manage_git {
    package { 'git':
      ensure => installed,
    }
  }

  nginx::vhost { $::fqdn:
    docroot => $basedir,
  }
}

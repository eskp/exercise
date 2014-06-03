# == Class: website
#
# Base class to get website's files onto a server

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

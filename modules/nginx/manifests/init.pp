# == Class: nginx
#
# Base class for Nginx.
# Installs the package(s), configures files/directories,
# enables and starts the service.
#
# === Parameters
#
# [*conf_dir*]
#   (string) Nginx configuration directory
#   Defaults to '/etc/nginx' ($::nginx::conf_dir)
#
# [*user*]
#   (string) Nginx system user
#   Defaults to 'www-data' ($::nginx::user)
#
# [*access_log*]
#   (string) Nginx access log file path
#   Defaults to '/var/log/nginx/access.log' ($::nginx::access_log)
#
# [*error_log*]
#   (string) Nginx error log file path
#   Defaults to '/var/log/nginx/error.log' ($::nginx::error_log)
#
# === Example
#
# class { 'nginx':
#   conf_dir => '/etc/httpd',
#   user     => 'www',
# }
#

class nginx(
  $conf_dir   = '/etc/nginx',
  $user       = 'www-data',
  $access_log = '/var/log/nginx/access.log',
  $error_log  = '/var/log/nginx/error.log',
) {

  include nginx::install, nginx::config, nginx::service

  Class['nginx::install'] -> Class['nginx::config'] -> Class['nginx::service']

}

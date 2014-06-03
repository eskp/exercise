# == Definition: nginx::vhost
#
# Installs Nginx Virtual Host template in
# Nginx site directory ($::nginx::conf_dir)/conf.d
#
# === Parameters
#
# [*docroot*]
#   (string) Document root directory where to serve files from
#   Defaults to '/var/www' ($::nginx::vhost::docroot)
#
# [*port*]
#   (int) Nginx virtual host port
#   Defaults to 8000 ($::nginx::vhost::port)
#
# === Example
#
# nginx::vhost { 'my_site':
#   docroot => '/srv/www',
#   port    => 8080,
# }
#

define nginx::vhost(
  $docroot='/var/www',
  $port=8000,
) {

  include nginx

  file { "${name}.conf":
    ensure  => file,
    path    => "${nginx::conf_dir}/conf.d/${name}.conf",
    content => template('nginx/vhost.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

# Definition: nginx::vhost
#
# This class install Nginx Virtual Host configuration

define nginx::vhost(
  $docroot='/var/www',
  $port='8000',
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

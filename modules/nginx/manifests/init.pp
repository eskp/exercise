# Main class to setup nginx Web Server

class nginx(
  $conf_dir   = '/etc/nginx',
  $user       = 'www-data',
  $access_log = '/var/log/nginx/access.log',
  $error_log  = '/var/log/nginx/error.log',
) {

  include nginx::install, nginx::config, nginx::service

  Class['nginx::install'] -> Class['nginx::config'] -> Class['nginx::service']

}

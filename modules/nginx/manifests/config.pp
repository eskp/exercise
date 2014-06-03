# Configuration files for Nginx Web Server

class nginx::config() {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  $conf_dir = $nginx::conf_dir

  file {
    $conf_dir:
      ensure => directory;

    "${conf_dir}/conf.d":
      ensure => directory;

    "${conf_dir}/nginx.conf":
      ensure  => file,
      content => template('nginx/nginx.conf.erb');

    "${conf_dir}/sites-enabled/default":
      ensure  => absent;
  }
}

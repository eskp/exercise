# Class to ensure Nginx daemon starts on boot
# and keeps on running

class nginx::service() {

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}

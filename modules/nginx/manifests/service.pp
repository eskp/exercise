# == Class: nginx::service
#
# Ensures Nginx daemon starts on boot and keeps running
#
#

class nginx::service() {

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}

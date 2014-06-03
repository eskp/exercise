# == Class: nginx::install
#
# Installs Nginx web server package
#
# === Notes:
#
# Currently supported operating system is Ubuntu.
#

class nginx::install() {

  case $::operatingsystem {
    ubuntu: { $package = 'nginx' }
    default: { fail('Unsupported operating system') }
  }

  package { 'nginx':
    ensure => installed,
    name   => $package,
  }
}

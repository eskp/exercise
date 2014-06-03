# Class to install Nginx Web Server Package

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

node 'web.box' {

  class { 'website':
    site_name  => 'puppetlabs',
    git_source => 'https://github.com/puppetlabs/exercise-webpage.git',
    manage_git => true,
  }

}

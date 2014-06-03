node 'web.box' {

  class { 'website':
    git_source => 'https://github.com/puppetlabs/exercise-webpage.git',
    manage_git => true,
  }

}

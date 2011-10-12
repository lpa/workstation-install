class workstation-install::aptsourceslist {
  
  case $operatingsystem {
    ubuntu: { $sourceslistfile = "puppet:///modules/workstation-install/sources.list"}
    default: { fail("Unsupported operating system, supported is Unbuntu 11.04") }
  }

  file {'sources.list':
    path => '/etc/apt/sources.list',
    ensure => file,
    source => $sourceslistfile,
    owner => 'root',
    group => 'root',
    mode => '644',
    notify  => Exec["/usr/bin/aptitude update"]
  }

  notify {'partner':
    message =>  'Adding partner packages repository to source list'
  }

  exec {'update packages list':
        command => '/usr/bin/apt-get update', 
        logoutput => on_failure,
        subscribe => File['sources.list'],
        refreshonly => true
  }

  File['sources.list'] -> Notify['partner']

  

}

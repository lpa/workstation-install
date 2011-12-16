class workstation-install::aptsourceslist {
  
    # TODO: comment rŽcupŽrer la version de l'OS ? besoin pour pointer vers un fichier de sources diffŽrent 
    
  case $::operatingsystem {
    ubuntu: { 
    	case $::operatingsystemrelease {
    		'10.04': {$sourceslistfile = 'puppet:///modules/workstation-install/sources.10.04.list'} 
    		'11.04': {$sourceslistfile = 'puppet:///modules/workstation-install/sources.11.04.list'}
    		default: { fail('Unsupported operating system, supported is ubuntu 10.04 and 11.04') }
    	}
    		}
    darwin: { fail('This seem to be a Mac, this operating system is not supported yet, supported is ubuntu 10.04 and 11.04')}
    default: { fail('Unsupported operating system, supported is ubuntu 10.04 and 11.04') }
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

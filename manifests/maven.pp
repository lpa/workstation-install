class workstation-install::maven {

  warning('Installing maven 3')

  $fcmsSettingsFile = 'puppet:///modules/workstation-install/settings.xml'
  
  # TODO: rŽcupŽrer sur le SVN fcms le nom de la clŽ ssh
  $fcmsSshKeyOne = 'puppet:///modules/workstation-install/???.pub'
  
  # TODO: le troisime fichier de clŽ ssh sur le SVN fcms sert il a qquchose ?

  # TODO: nom du package maven 3 pour ubuntu ?
  package {'maven-???':
        ensure => installed,
        subscribe => Exec['update packages list']
  }
  
  # TODO: tout ce qui est Žcrit dans ~/.m2 ne doit pas l'tre en root 
  
  file {'settings FCMS':
    path => '~/.m2/settings.xml',
    ensure => file,
    source => $fcmsSettingsFile,
    owner => 'root',
    group => 'root',
    mode => '644',
  }
  

  file {'ssh keys for Nexus':
    path => '~/.m2/???.pub',
    ensure => file,
    source => $fcmsSshKeyOne,
    owner => 'root',
    group => 'root',
    mode => '644',
  }
  
  file {'repository directory':
  	path => '~/.m2/repository/',
  	ensure => directory,
  	owner => 'root',
  	group => 'root',
  }  



}

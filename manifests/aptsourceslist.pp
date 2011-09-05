class workstation-install::aptsourceslist {
  
  case $operatingsystem {
    ubuntu: { $sourceslistfile = "puppet:///modules/workstation-install/sources.list"}
    default: { fail("Unsupported operating system, supported is Unbuntu 11.04") }
  }

   
  file {'sources.list':
    path     => '/etc/apt/sources.list',
    ensure   => file,
    source   => $sourceslistfile,
    owner    => 'root',
    group    => 'root',
    mode     => '644'
  }

  notify {'backports':
    message =>  'Adding backport package list (for sun-jdk-6)'
  }

  File['sources.list'] -> Notify['backports']

}

#no more need of declaration, launched by module invocation 
#class { 'aptsourceslist': }

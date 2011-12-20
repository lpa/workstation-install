  class workstation-install::test {
  
  
  file {'etc-jetty-realm':
    path => '/tmp/jetty/realm.properties',
    ensure => file,
    source => 'jetty/6.1.24/etc-jetty-realm.properties',
    owner => 'root',
    group => 'root',
    mode => '644'
  }
  
  
  }
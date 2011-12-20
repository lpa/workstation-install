class workstation-install::jetty {

  warning('Installing jetty server')

  package {'jetty':
        ensure => installed,
        subscribe => Exec['update packages list'],
        notify => Exec['wget -O /usr/share/java/tomcat-jdbc-7.0.22.jar http://mvnrepository.adencf.local/nexus/service/local/repositories/central/content/org/apache/tomcat/tomcat-jdbc/7.0.22/tomcat-jdbc-7.0.22.jar; 
        				ln -s /usr/share/java/tomcat-jdbc-7.0.22.jar /usr/share/java/tomcat-jdbc.jar']
  }
  
  package {'libjetty-extra':
        ensure => installed,
        subscribe => Exec['update packages list']
  }  

  package {'libmysql-java':
        ensure => installed,
        subscribe => Exec['update packages list']
  }
  
  # TODO: finir avec les 3 autres fichiers
  
  file {'etc-default-jetty':
    path => '/etc/default/jetty',
    ensure => file,
    source => '../files/jetty/6.1.24/etc-default-jetty',
    owner => 'root',
    group => 'root',
    mode => '644',
    notify  => Exec["/usr/bin/aptitude update"]
  }
    
  File['etc-default-jetty'] -> Notify['jetty']



}



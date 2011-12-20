class workstation-install::jetty {

  warning('Installing jetty server')

exec { "download-tomcat-jdbc-pool":
    command => "wget -O /usr/share/java/tomcat-jdbc-7.0.22.jar http://mvnrepository.adencf.local/nexus/service/local/repositories/central/content/org/apache/tomcat/tomcat-jdbc/7.0.22/tomcat-jdbc-7.0.22.jar",
    path    => "/usr/local/bin/:/bin/:/usr/bin"
}

  package {'jetty':
        ensure => installed,
        notify => Exec['download-tomcat-jdbc-pool']
  }
  
  package {'libjetty-extra':
        ensure => installed,
  }  

  package {'libmysql-java':
        ensure => installed,
  }
  
  #create symlink
  file { "/usr/share/java/tomcat-jdbc.jar":
  	ensure => "/usr/share/java/tomcat-jdbc-7.0.22.jar" 
  }

  
  file {'etc-default-jetty':
    path => '/etc/default/jetty',
    ensure => file,
    source => 'jetty/6.1.24/etc-default-jetty',
    owner => 'root',
    group => 'root',
    mode => '644'
  }
  
  file {'etc-jetty-jetty':
    path => '/etc/jetty/jetty.xml',
    ensure => file,
    source => 'jetty/6.1.24/etc-jetty-jetty.xml',
    owner => 'root',
    group => 'root',
    mode => '644'
  }
  
  file {'etc-jetty-realm':
    path => '/etc/jetty/realm.properties',
    ensure => file,
    source => 'jetty/6.1.24/etc-jetty-realm.properties',
    owner => 'root',
    group => 'root',
    mode => '644'
  }
  
  file {'etc-jetty-start':
    path => '/etc/jetty/start.config',
    ensure => file,
    source => 'jetty/6.1.24/etc-jetty-start.config',
    owner => 'root',
    group => 'root',
    mode => '644'
  }

}


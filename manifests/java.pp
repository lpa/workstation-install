class workstation-install::java {

  warning('Installing sun-java6-jdk')

  package {'sun-java6-jdk':
        ensure => installed,
        subscribe => Exec['update packages list']
  }

}

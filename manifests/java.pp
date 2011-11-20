class workstation-install::java {

  warning('Installing sun-java6-jdk')

  # TODO: voir sur le SVN exploite comment ils installent les packages
  package {'sun-java6-jdk':
        ensure => installed,
        subscribe => Exec['update packages list']
  }

}

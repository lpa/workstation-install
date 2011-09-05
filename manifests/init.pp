# include all classes to call for a complete workstation installation

class workstation-install {

  notify {'install-started':
    message => 'Starts a fresh install of your workstation ...'
  }

  include aptsourceslist

}


#include java
#include appserver
#include browser
#include database
#include ide
#include projects
#include utilities 
#include vm

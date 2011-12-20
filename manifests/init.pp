# include all classes to call for a complete workstation installation

# TODO: Regarder cucumber-puppet

class workstation-install {

  warning('Starts a fresh install of your workstation ...')
  include test
  #include aptsourceslist
  #include java

}

#include appserver
#include browser
#include database
#include ide
#include projects
#include utilities 
#include vm

node default {
  package { 'vim' : ensure => present }
  package {'mc' : ensure => present }
  include sudo
  include hosts_file
  
}
node 'db.micro-agents.net' inherits default {
  include mysql
  
}


node 'mgmt.micro-agents.net' inherits default {
	include nagios3
}


node 'storage.micro-agents.net' inherits default
{
	include nrpe
}

node 'app.micro-agents.net' inherits default
{
	include nrpe
}

node 'ad.directory.micro-agents.net' {
 include hosts_file
}


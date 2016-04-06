class nrpe::install{

	package{"nagios-nrpe-server" :
	ensure => present,
	require => User["nagios"],
	}
 
	user{"nagios" :
	ensure => present,
	comment => "Nagios user",
	gid => "nagios",
	shell => "/bin/false",
	require => Group["nagios"], 
	}

	group{ "nagios" :
	ensure => present,
	}

 }



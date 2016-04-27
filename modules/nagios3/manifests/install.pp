class nagios3::install{

	package{"nagios3" :
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

	package{"libwww-perl" :
	ensure => present,
	}

	package{"libcrypt-ssleay-perl" :
	ensure => present,
	}

	package{"nagios-nrpe-plugin" :
	ensure => present,
	}

 }



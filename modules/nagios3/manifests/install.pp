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
	
	file{'/usr/local/bin/slack_nagios.pl':
	owner => "root",
	group => "staff",
	mode => "755",
	source => "puppet://modules/nagios3/slack_nagios.pl",
	}

 }



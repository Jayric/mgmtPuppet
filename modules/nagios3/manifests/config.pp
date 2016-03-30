class nagios3::config {
	file{ "/etc/nagios3/nagios.cfg" :
	ensure => present,
	source => "puppet:///modules/nagios3/nagios.cfg",
	mode => "0644",
	owner => "root",
	group => "root",
	require => Class["nagios3::install"],
	notify => Class["nagios3::service"],
	}
	
}

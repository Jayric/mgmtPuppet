class nrpe::config{

	file{"/usr/lib/nagios/plugins/check_mem":
	ensure => present,
	source => "puppet:///modules/nrpe/check_mem",
	mode => 0755,
	owner => "root",
	group => "root",
		
	}

	file{"/etc/nagios-plugins/config/mem.cfg":
	ensure => present,
	source => "puppet:///modules/nrpe/mem.cfg",
	mode => 0644,
	owner => "root",
	group => "root",
	}
}

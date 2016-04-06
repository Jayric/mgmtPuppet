class nrpe {
	include nrpe::install, nrpe::config, nrpe::service
        
        if $hostname == 'db'{
           include db_nrpe_config
        }
        
}

class nrpe::db_nrpe_config{
	file{"/etc/nagios" :
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => 0644,
	content => template('nrpe/dbnrpeconfig.erb'),
	}
}	

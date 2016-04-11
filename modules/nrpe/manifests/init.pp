class nrpe {
	include nrpe::install, nrpe::config, nrpe::service
        
        if $hostname == 'db'{
		
           include db_nrpe_config
        }
		elsif $hostname == 'app'
		{
			include app_nrpe_config
			
		} elsif $hostname == 'storage'
		{
			include storage_nrpe_config
		}
        
}

class nrpe::db_nrpe_config{
	file{"/etc/nagios/nrpe.cfg" :
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => 0644,
	content => template('nrpe/db_nrpeconfig.erb'),
	}
	
	class nrpe::storage_nrpe_config{
	file{"/etc/nagios/nrpe.cfg" :
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => 0644,
	content => template('nrpe/storage_nrpeconfig.erb'),
	}
	
	class nrpe::app_nrpe_config{
	file{"/etc/nagios/nrpe.cfg" :
	ensure => present,
	owner => 'root',
	group => 'root',
	mode => 0644,
	content => template('nrpe/app_nrpeconfig.erb'),
	}
}	

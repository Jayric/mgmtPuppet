class bacula-file::config{
	
	file{"/etc/bacula/bacula-fd.conf":
	ensure => present,
	mode => 0640,
	owner => "root",
	group => "root",
	content => template('bacula-file/bacula-fd.erb'),
	notify => Class["bacula-file::service"],
	}
}

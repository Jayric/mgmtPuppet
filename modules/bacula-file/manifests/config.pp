class bacula-file::config{
	
	file{"/etc/bacula/bacula-fd.conf":
	ensure => present,
	source => "puppet:///modules/bacula-file/bacula-fd.conf",
	mode => 0640,
	owner => "root",
	group => "root",
	notify => Class["bacula-file::service"],
	}
}

class bacula-storage::config{

	file{"/etc/bacula/bacula-sd.conf":
	ensure => present,
	source => "puppet:///modules/bacula/bacula-sd.conf",
	mode => 0640,
	owner => "bacula",
	group => "bacula",
	notify => Class["bacula-storage::service"],
	}
}

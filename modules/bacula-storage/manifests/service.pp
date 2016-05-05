class bacula-storage::service{
	service { "bacula-sd" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	enable => true,
	}
}

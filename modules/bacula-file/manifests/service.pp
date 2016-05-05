class bacula-file::service{
	service {"bacula-fd" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	enable => true,
	}
}

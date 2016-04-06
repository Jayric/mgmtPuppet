class nrpe::service {
	service { "nrpe" :
	ensure => running,
	hasstatus => true,
	hasrestart => true,
	enable => true,
	require => Class["nrpe::config"],
	}
}

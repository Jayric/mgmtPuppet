class hosts_file {

	if $lsbdistid == 'Debian'{
	include deb_hosts
        }
        elsif $lsbdistid == 'Ubuntu' {
        include ubun_hosts
        }
        elsif $osfamily == 'windows'{
       	include win_hosts
        } 
}

class hosts_file::deb_hosts{
	file { "/etc/hosts" :
	 ensure => present,
	 owner => 'root',
	 group => 'root',
	 mode => 0444,
	 content => template('hosts_file/debhosts.erb'),
	}
}

class hosts_file::ubun_hosts{
	file { "/etc/hosts" :
	 ensure => present,
	 owner => 'root',
	 group => 'root',
	 mode => 0444,
	 content => template('hosts_file/ubunhosts.erb'),
	}
}

class hosts_file::win_hosts{
	file{"C:/windows/System32/drivers/etc/hosts" :
	ensure => present,
	content => template('hosts_file/winhosts.erb'),
	}
}

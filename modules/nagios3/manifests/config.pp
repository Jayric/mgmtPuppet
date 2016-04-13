class nagios3::config{
	file{ "/etc/nagios3/nagios.cfg" :
	ensure => present,
	source => "puppet:///modules/nagios3/nagios.cfg",
	mode => "0644",
	owner => "root",
	group => "root",
	require => Class["nagios3::install"],
	notify => Class["nagios3::service"],
	}

	nagios_contact{'rhorne' :
	target => "/etc/nagios3/conf.d/ppt_contacts.cfg",
	alias => "Richard Horne",
	service_notification_period => "24x7",
	host_notification_period => "24x7",
	service_notification_options => 'w,u,c,r',
	host_notification_options => 'd,r',
	service_notification_commands => 'notify-service-by-email',
	host_notification_commands => 'notify-host-by-email',
	email => 'root@localhost',
	}

	nagios_contact { 'jwatpisit' :
        target => "/etc/nagios3/conf.d/ppt_contacts.cfg",
        alias => "Jay Watphisit",
        service_notification_period => "24x7",
        host_notification_period => "24x7",
        service_notification_options => 'w,u,c,r',
        host_notification_options => 'd,r',
        service_notification_commands => 'notify-service-by-email',
        host_notification_commands => 'notify-host-by-email',
        email => 'root@localhost',
        }

	nagios_contactgroup { 'sysadmins':
	target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
	alias => 'Systems Administrators',
	members => 'rhorne, jwatpisit',
	}

	nagios_host { 'db.micro-agents.net':
	target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
	alias => 'db',
	address => '10.25.1.55',
	check_period => '24x7',
	max_check_attempts => 3,
	check_command => 'check-host-alive',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'd,u,r',
	contact_groups => 'sysadmins',
	}

	nagios_host { 'storage.micro-agents.net':
	target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
	alias => 'Storage',
	address => '10.25.1.53',
	check_period => '24x7',
	max_check_attempts => 3,
	check_command => 'check-host-alive',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'd,u,r',
	contact_groups => 'sysadmins',
	}
	
	nagios_host { 'app.micro-agents.net':
	target => '/etc/nagios3/conf.d/ppt_hosts.cfg',
	alias => 'App',
	address => '10.25.1.51',
	check_period => '24x7',
	max_check_attempts => 3,
	check_command => 'check-host-alive',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'd,u,r',
	contact_groups => 'sysadmins',
	}	
	

	nagios_service {'MySQL':
	service_description => 'MySQL DB',
	hostgroup_name => 'db-servers',
	target => '/etc/nagios3/conf.d/ppt_mysql_service.cfg',
	check_command => 'check_mysql_cmdlinecred!$USER3$!$USER4$',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	
	nagios_service {'Remote-Disks':
	service_description => 'Check Disk low on space',
	hostgroup_name => 'linux-Standard-Monitor',
	target => '/etc/nagios3/conf.d/ppt_CheckDBDisk.cfg',
	check_command => 'check_nrpe_1arg!check_hda',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	
	
	nagios_service {'Remote-Load':
	service_description => 'Check Server Load',
	hostgroup_name => 'linux-Standard-Monitor',
	target => '/etc/nagios3/conf.d/ppt_Check_Remote_Server_Load.cfg',
	check_command => 'check_nrpe_1arg!check_load',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	
	nagios_service {'Remote-Users':
	service_description => 'Check logged on Users',
	hostgroup_name => 'linux-Standard-Monitor',
	target => '/etc/nagios3/conf.d/ppt_Check_Remote_User_Load.cfg',
	check_command => 'check_nrpe_1arg!check_users',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	
	nagios_service {'Remote-Processes-Total':
	service_description => 'Check Total number of processes',
	hostgroup_name => 'linux-Standard-Monitor',
	target => '/etc/nagios3/conf.d/ppt_Check_Remote_Process_Total.cfg',
	check_command => 'check_nrpe_1arg!check_total_procs',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	
	nagios_service {'Remote-Processes-Zombie':
	service_description => 'Check for Zombie processes',
	hostgroup_name => 'linux-Standard-Monitor',
	target => '/etc/nagios3/conf.d/ppt_Check_Zombie_Process.cfg',
	check_command => 'check_nrpe_1arg!check_zombie_procs',
	max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}

        nagios_service {'Remote-Memory':
        service_description => 'Check for Memory',
        hostgroup_name => 'linux-Standard-Monitor',
        target => '/etc/nagios3/conf.d/ppt_Check_Memory.cfg', 
	check_command => 'check_nrpe_1arg!check_mem',
        max_check_attempts => 3,
	retry_check_interval => 1,
	normal_check_interval => 5,
	check_period => '24x7',
	notification_interval => 30,
	notification_period => '24x7',
	notification_options => 'w,u,c',
	contact_groups => 'sysadmins',
	}
	

	nagios_hostgroup{'db-servers':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'Database Servers',
	members => 'db.micro-agents.net',
	}
	
	nagios_hostgroup{'linux-Standard-Monitor':
	target => '/etc/nagios3/conf.d/ppt_hostgroups.cfg',
	alias => 'Linux Servers',
	members => 'db.micro-agents.net,app.micro-agents.net,storage.micro-agents.net',
	}
	

}

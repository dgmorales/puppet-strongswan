class strongswan::config {

	file { $strongswan::ipsec_conf:
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template('strongswan/ipsec.conf.erb'),
		notify  => Class[Strongswan::Service],
		require => File[$strongswan::ipsec_conf_dir]
	}

	file { $strongswan::ipsec_conf_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
	}

  file { "${strongswan::ipsec_conf_dir}/empty.conf":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/strongswan/empty.conf',
  }

	file { $strongswan::ipsec_secrets:
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0600',
		content => template("strongswan/ipsec.secrets.${osfamily}.erb"),
		notify  => Class[Strongswan::Service],
		require => File[$strongswan::ipsec_secrets_dir]
	}

	file { $strongswan::ipsec_secrets_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0700',
	}
}

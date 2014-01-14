class strongswan::config {

	file { $strongswan::ipsec_conf:
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template('strongswan/ipsec.conf.erb'),
		notify  => Service[$strongswan::servicename],
		require => File[$strongswan::ipsec_conf_dir]
	}

	file { $strongswan::ipsec_conf_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
	}

	file { $strongswan::ipsec_secrets:
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0600',
		content => template("strongswan/ipsec.secrets.${operatingsystem}.erb"),
		notify  => Service[$strongswan::servicename],
		require => File[$strongswan::ipsec_secrets_dir]
	}

	file { $strongswan::ipsec_secrets_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0700',
	}
}

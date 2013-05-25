define strongswan::secret($conn_name = $title, $comment = "Secret for ${title}.", $line) {

	include strongswan
	
	file { "${strongswan::params::ipsec_secrets_dir}/${conn_name}.secret":
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0600',
		content => template('strongswan/ipsec.secret.erb'),
		notify  => Service[$strongswan::params::servicename],
	}
}

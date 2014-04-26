define strongswan::conn(
  $conn_name = $title,
  $description = "Connection $conn_name",
  $hash = {}
  ) {

  #include strongswan

	file { "${strongswan::ipsec_conf_dir}/${conn_name}.conf":
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template('strongswan/ipsec.conn.erb'),
		notify  => Class[Strongswan::Service],
	}
}

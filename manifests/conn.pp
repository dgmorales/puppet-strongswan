define strongswan::conn(
  $conn_name  = $title, $description, $left, $right,
  $enable_dpd = false,
  $dpdaction  = 'restart',
  $dpddelay   = '30s',
  ) {

	include strongswan

	file { "${strongswan::ipsec_conf_dir}/${conn_name}.conf":
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template('strongswan/ipsec.conn.erb'),
		notify  => Service[$strongswan::servicename],
	}
}

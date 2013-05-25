class strongswan::params {
	# These variables will be converted to real parameters someday.
	# For now they are hardcoded here.
	$packagename = 'strongswan-ikev2'
	$servicename = 'ipsec'
	$plutostart = 'no'
	$charonstart = 'yes'
	$ipsec_conf_dir = '/etc/ipsec.conf.d'
	$ipsec_secrets_dir = '/etc/ipsec.secrets.d'
}

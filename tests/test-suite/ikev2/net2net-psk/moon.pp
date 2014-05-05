# based on
# http://www.strongswan.org/uml/testresults/ikev2/net2net-psk/moon.ipsec.conf

include strongswan

$default = {
  ikelifetime => '60m',
  keylife => '20m',
  rekeymargin => '3m',
  keyingtries => '1',
  authby => 'secret',
  keyexchange => 'ikev2',
  mobike => 'no',
}

$config =  {
  left => '192.168.0.1',
  leftsubnet => '10.1.0.0/16',
  leftid => '@moon.strongswan.org',
  leftfirewall => 'yes',
  right => '192.168.0.2',
  rightsubnet => '10.2.0.0/16',
  rightid => '@sun.strongswan.org',
  auto => 'add',
}

strongswan::conn { 'default':
  conn_name => '%default',
  hash => $default,
}

strongswan::conn { 'net-net':
  description => 'Site to site PSK example, host moon'
  hash => $config,
}

strongswan::secret {'net-net':
  line => '%any 172.16.0.2 : PSK "dhjkashdjkasdhk"',
}


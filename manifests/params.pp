class strongswan::params {
  case $::osfamily {
    'Debian': {
       $packagename = 'strongswan-ikev2'
       $servicename = 'ipsec'
       $ipsec_conf = '/etc/ipsec.conf'
       $ipsec_conf_dir = '/etc/ipsec.conf.d'
       $ipsec_secrets = '/etc/ipsec.secrets'
       $ipsec_secrets_dir = '/etc/ipsec.secrets.d'
    }

    #'RedHat': {
    #}

    default: {
       fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}

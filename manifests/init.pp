# == Class: strongswan
#
# Full description of class strongswan here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { strongswan:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#

class strongswan(
  $ipsec_conf = $strongswan::params::ipsec_conf,
  $ipsec_conf_dir = $strongswan::params::ipsec_conf_dir,
  $ipsec_secrets = $strongswan::params::ipsec_secrets,
  $ipsec_secrets_dir = $strongswan::params::ipsec_secrets_dir,
  $packagename = $strongswan::params::packagename,
  $servicename = $strongswan::params::servicename,
  $dont_change_svc = false,
  $plutostart = undef,
  $charonstart = undef,
) inherits strongswan::params {

  class{'strongswan::install': } ->
  class{'strongswan::config': } ~>
  class{'strongswan::service': } ->
  Class["strongswan"]
}

# These classes are so simple I think them being here is clearer than
# separating them.
class strongswan::install {
	package { $strongswan::packagename:
		ensure => installed,
	}
}

class strongswan::service {
	service { $strongswan::servicename:
		ensure  => $dont_change_svc ? { true => undef, default => 'running', },
		enable  => $dont_change_svc ? { true => undef, default => true, },
	}
}

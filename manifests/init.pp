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

class strongswan($dont_change_svc = false) {

	include strongswan::params

	package { $strongswan::params::packagename:
		ensure => installed,
	}

	service { $strongswan::params::servicename:
		ensure  => $dont_change_svc ? { true => undef, default => 'running', },
		enable  => $dont_change_svc ? { true => undef, default => true, },
		require => Package[$strongswan::params::packagename],
	}

	file { '/etc/ipsec.conf':
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		content => template('strongswan/ipsec.conf.erb'),
		notify  => Service[$strongswan::params::servicename],
		require => File[$strongswan::params::ipsec_conf_dir]
	}

	file { $strongswan::params::ipsec_conf_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
	}

	file { '/etc/ipsec.secrets':
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0600',
		content => template("strongswan/ipsec.secrets.${operatingsystem}.erb"),
		notify  => Service[$strongswan::params::servicename],
		require => File[$strongswan::params::ipsec_secrets_dir]
	}

	file { $strongswan::params::ipsec_secrets_dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0700',
	}
}

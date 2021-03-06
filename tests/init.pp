# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test in a virtual environment
# (to compare the resulting system state to the desired state).
#
# Learn more about module testing here: http://docs.puppetlabs.com/guides/tests_smoke.html
#

if $::osfamily == 'RedHat' {
  include epel
  Class['epel'] -> Class['strongswan']
}
include strongswan

strongswan::conn { 'test_conn1':
  description => 'Test connection 1',
  hash => {
    left => '%defaultroute',
    right => '172.16.0.2',
  }
}

strongswan::secret {'test_conn1':
  line => '%any 172.16.0.2 : PSK "dhjkashdjkasdhk"',
}

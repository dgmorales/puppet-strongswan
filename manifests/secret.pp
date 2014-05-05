define strongswan::secret(
  $secret_name = $title,
  $source = '_UNSET_',
  $content = '_UNSET_',
) {

  if ($source == '_UNSET_' and $content == '_UNSET_') or ($source != '_UNSET_'
  and $content != '_UNSET_') {
    fail('You must specify either source or content, not both, not none.')
  }

  include strongswan

  file { "${strongswan::ipsec_secrets_dir}/${secret_name}.secret":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => $source ? { '_UNSET_' => undef, default => $source, },
    content => $content ? { '_UNSET_' => undef, default => "$content\n", },
    notify  => Class[Strongswan::Service],
  }
}

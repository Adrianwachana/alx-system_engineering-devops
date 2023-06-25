# Creates the file school in the /tmp directory with the content "I love Puppet" and the permissions 0744.

$doc_root = '/tmp'

file { $doc_root:
  ensure => 'directory',
}

file { "${doc_root}/school":
  ensure  => 'file',
  content => 'I love Puppet',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  require => File[$doc_root],
}

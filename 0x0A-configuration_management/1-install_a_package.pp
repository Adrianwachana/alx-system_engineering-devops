# Using Puppet, install flask from pip 3. Ensure Python 3.8.10 is installed, Flask 2.1.0 is installed.
$bin = '/usr/bin'

# Update the package manager
exec { 'update':
  command => 'apt-get update',
  path    => $bin,
}

# Install Python 3.8.10 using apt
package { 'python3.8.10':
  ensure   => 'present',
  provider => 'apt',
  require  => Exec['update'],
}

# Install pip3
package { 'python3-pip':
  ensure   => 'present',
  provider => 'apt',
  require  => Exec['update'],
}

# Install Flask 2.1.0
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

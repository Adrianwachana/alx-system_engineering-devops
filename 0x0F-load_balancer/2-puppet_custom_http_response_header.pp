# 2-puppet_custom_http_response_header.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define a custom fact to retrieve the server's hostname
Facter.add('server_hostname') do
  setcode do
    require 'socket'
    Socket.gethostname
  end
end

# Configure Nginx with custom HTTP header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "# Custom HTTP RESPONSE HEADER\n
              server {\n
                listen 80 default_server;\n
                server_name _;\n
                add_header X-Served-By $::server_hostname;\n
                # ... other Nginx configuration ...\n
              }",
  require => Package['nginx'],
}

# Create a symbolic link to enable the site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [Package['nginx'], File['/etc/nginx/sites-enabled/default']],
}


#!/usr/bin/env bash
# Using Puppet to make changes to our configuration file

# Define a Puppet resource for managing the 'ssh_config' file.
file { '/etc/ssh/ssh_config':
    ensure  => present,  # Ensure the file is present on the system.

    content => "
        # SSH client configuration
        Host *
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
    "
}


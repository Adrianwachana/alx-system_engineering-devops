# Using Puppet, create a manifest that kills a process named killmenow
# Must use the exec resource
# Must use pkill

exec { 'killmenow':
  command => 'pkill killmenow',
  path    => '/usr/bin',
  onlyif  => 'pgrep killmenow',
}

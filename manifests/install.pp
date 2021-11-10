#
# == Class: nano::install
#
# Install nano
#
class nano::install (Boolean $default = $::nano::params::default) inherits ::nano::params {
  package { 'nano':
    ensure => 'installed',
    name   => 'nano'
  }

  if $default {
    file { '/etc/profile.d/nano.sh':
      ensure  => 'file',
      source  => 'puppet:///modules/nano/nano.sh',
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      require => Package['nano']
    }
  } else {
    file { '/etc/profile.d/nano.sh': ensure => 'absent' }
  }
}

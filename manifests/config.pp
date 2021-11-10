#
# == Class: nano::config
#
# Configure nano
#
class nano::config (
  Array[String] $exclude = $::nano::params::exclude,
  Boolean $casesensitive = $::nano::params::casesensitive,
  Boolean $const         = $::nano::params::const,
  Boolean $cut           = $::nano::params::cut,
  Boolean $morespace     = $::nano::params::morespace,
  Boolean $noconvert     = $::nano::params::noconvert,
  Boolean $nohelp        = $::nano::params::nohelp,
  Boolean $nonewlines    = $::nano::params::nonewlines,
  Boolean $nowrap        = $::nano::params::nowrap,
  Boolean $regexp        = $::nano::params::regexp,
  Boolean $smarthome     = $::nano::params::smarthome,
  Boolean $smooth        = $::nano::params::smooth,
  Integer $tabsize       = $::nano::params::tabsize,
  Boolean $tabstospaces  = $::nano::params::tabstospaces) inherits ::nano::params
  {
    unless $tabsize == undef
    {
      validate_re($tabsize, '^[1-8]$')
    }

    if is_array($exclude) {
      $ignore = suffix($exclude, '.nanorc')
      $includes = difference($::nano::params::highlights, $exclude)
    }
    else
    {
      $ignore = ''
      $includes = $::nano::params::highlights
    }

    file { '/usr/share/nano':
      ensure  => 'directory',
      recurse => 'remote',
      source  => "puppet:///modules/${module_name}/highlights",
      ignore  => $ignore
    }

    # Generate the nanorc configuration file
    file { '/etc/nanorc':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/nanorc.erb")
  }
}

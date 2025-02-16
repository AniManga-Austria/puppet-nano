# == Class: nano
#
# Class to manage installing and configuring nano with sane defaults.
# Optionally, it can also be set to the default editor
#
# === Parameters
# [default]
# Set nano to the default editor
# default = false
#
# [exclude]
# Syntax highlights to exclude
# default = undef
#
# [casesensitive]
# Do case sensitive searches by default
# default = false
#
# [const]
# Constantly display the cursor position in the statusbar
# default = true
#
# [cut]
# Use cut to end of line by default
# default = false
#
# [morespace]
# Use the blank line below the titlebar as extra editing space
# default = true
#
# [noconvert]
# Don't convert files from DOS/Mac format
# default = false
#
# [nohelp]
# Don't display the helpful shortcut lists at the bottom of the screen
# default = true
#
# [nonewlines]
# Don't add newlines to the ends of files
# default = false
#
# [nowrap]
# Don't wrap text at all
# default = true
#
# [regexp]
# Do extended regular expression searches by default
# default = false
#
# [smarthome]
# Make the Home key smarter
# default = true
#
# [smooth]
# Use smooth scrolling as the default
# default = true
#
# [tabsize]
# Use this tab size instead of the default; it must be greater than 0
# default = undef
#
# [tabstospaces]
# Convert typed tabs to spaces
# default = false
#
# === Examples
#
#  class { nano:
#    default => false,
#    tabsize => 4,
#    exclude => ['html', 'php']
#  }
#
# === Authors
#
# cornfeedhobo <cornfeedhobo@fuzzlabs.org>
#
# === Copyright
#
# Copyright 2014 cornfeedhobo
#
class nano (
  Boolean $default                 = false,
  Array[String] $exclude           = [],
  Boolean $casesensitive           = false,
  Boolean $const                   = true,
  Boolean $cut                     = false,
  Boolean $morespace               = true,
  Boolean $noconvert               = true,
  Boolean $nohelp                  = true,
  Boolean $nonewlines              = false,
  Boolean $nowrap                  = true,
  Boolean $regexp                  = false,
  Boolean $smarthome               = true,
  Boolean $smooth                  = true,
  Integer $tabsize                 = 4,
  Boolean $tabstospaces            = false)
{
  notice('nano::begin')
  include ::nano::install
  include ::nano::config
  notice('nano::end')
}

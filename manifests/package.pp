# == Class: munin::package
#
# Installs munin-node package
#
class munin::package($ensure = 'present') {

  package { 'munin-node':
    ensure => $ensure,
  }

}

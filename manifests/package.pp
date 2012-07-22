class munin::package($ensure = 'present') {

  package { 'munin-node':
    ensure => $ensure,
  }

}

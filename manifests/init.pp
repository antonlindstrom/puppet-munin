class munin($ensure = 'present') {
  require munin::config

  class { 'munin::package':
    ensure => $ensure,
  }

  class { 'munin::service':
    ensure => $ensure,
  }

}

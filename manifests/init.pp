class munin($ensure = 'present') {

  class { 'munin::package':
    ensure => $ensure,
  }

  class { 'munin::service':
    ensure => $ensure,
  }

  class { 'munin::config':
    ensure => $ensure,
  }

}

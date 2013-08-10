# == Class: munin::service
#
# Ensures that munin-node is running
#
class munin::service ($ensure = 'present') {

  $ensure_service = $ensure ? {
    'present' => 'running',
    'absent'  => 'stopped',
  }

  service { 'munin-node':
    ensure      => $ensure_service,
    enable      => true,
    hasrestart  => true,
    require     => Class['munin::package'],
  }

}

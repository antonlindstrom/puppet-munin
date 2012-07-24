class munin::config(
    $ensure         = 'present',
    $listen_address = '*',
    $listen_port    = '4949',
    $ignore_files   = [],
    $pollers        = []
  ) {

  file { 'munin-node.conf':
    ensure    => $ensure,
    owner     => root,
    group     => root,
    mode      => '0644',
    path      => '/etc/munin/munin-node.conf',
    content   => template('munin/munin-node.conf.erb'),
    require   => Class['munin::package'],
    notify    => Class['munin::service'],
  }

}

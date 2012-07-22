class munin::config(
    $ensure         = 'present',
    $listen_address = '*',
    $listen_port    = '4949',
    $ignore_files   = [],
    $pollers        = []
  ) {

  file { '/etc/munin/munin-node.conf':
    ensure    => $ensure,
    owner     => root,
    group     => root,
    mode      => '0644',
    content   => template('munin/munin-node.conf.erb'),
    require   => Class['munin::package'],
    notify    => Class['munin::service'],
  }

}

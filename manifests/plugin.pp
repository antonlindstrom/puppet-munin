define munin::plugin(
    $ensure      = 'present',
    $script_path = '',
    $config      = '')
{
  $plugin      = "/etc/munin/plugins/${name}"
  $plugin_conf = "/etc/munin/plugin-conf.d/${name}.conf"

  if $script_path {
    $script_dir = $script_path
  } else {
    $script_dir = $::operatingsystem ? {
      'Archlinux' => '/usr/lib/munin/plugins',
      default     => '/usr/share/munin/plugins',
    }
  }

  $ensure_link = $ensure ? {
    present => link,
    default => $ensure,
  }

  file { $plugin:
    ensure  => $ensure_link,
    target  => "${script_dir}/${name}",
    require => Class['munin::package'],
    notify  => Class['munin::service'],
  }

  file { $plugin_conf:
    ensure  => $ensure,
    content => "[${name}]\n${config}",
    mode    => '0644',
    owner   => root,
    group   => root,
  }
}

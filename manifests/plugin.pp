define munin::plugin(
    $ensure      = 'present',
    $script_path = '',
    $config      = '')
{
    $plugin      = "/etc/munin/plugins/${name}"
    $plugin_conf = "/etc/munin/plugin-conf.d/${name}.conf"

    if $script_path {
        $script_dir = $script_path
    }
    else {
        $script_dir = $::operatingsystem ? {
            'Archlinux' => '/usr/lib/munin/plugins',
            default     => '/usr/share/munin/plugins',
        }
    }

    case $ensure {
        'absent': {
            file { $plugin: 
                ensure => $ensure,
            }
        }

        default: {
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
        }
    }

    case $config {
        '': {
            file { $plugin_conf:
                ensure => absent,
            }
        }

        default: {
            case $ensure {
                'absent': {
                    file { $plugin_conf:
                        ensure => $ensure,
                    }
                }

                default: {
                    file { $plugin_conf: 
                        content => "[${name}]\n${config}",
                        mode    => 0644,
                        owner   => root,
                        group   => root,
                    }
                }
            }
        }
    }
}

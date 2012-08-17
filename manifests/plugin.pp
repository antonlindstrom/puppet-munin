define munin::plugin(
    $ensure      = 'present',
    $script_path = '/usr/lib/munin/plugins',
    $config      = '')
{
    $plugin      = "/etc/munin/plugins/${name}"
    $plugin_conf = "/etc/munin/plugin-conf.d/${name}.conf"

    case $ensure {
        'absent': {
            file { $plugin: 
                ensure => absent,
            }
        }

        default: {
            file { $plugin:
                ensure  => link,
                target  => "${script_path}/${name}",
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
                        ensure => absent,
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

include munin

munin::plugin {
    ['cpu', 'load']:
        ensure => present
}

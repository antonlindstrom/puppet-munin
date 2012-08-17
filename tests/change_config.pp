class { 'munin::config':
  ensure          => present,
  listen_address  => '127.0.0.1',
  listen_port     => '6000',
  ignore_files    => [ 'DEADJOE$' ],
  pollers         => [
    '^::1$',
    '^127\.0\.0\.1$'
  ],
}

include munin

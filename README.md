# Munin-node module

[![Build Status](https://secure.travis-ci.org/antonlindstrom/puppet-munin.png?branch=master)](http://travis-ci.org/antonlindstrom/puppet-munin)

This is a module for managing munin-node on nodes.

### Usage

    include munin

#### Configuration settings

`munin::config` is configuring the settings in `/etc/munin/munin-node.conf`.

These are the settings that are currently available:

    class { 'munin::config':
      ensure          => present,
      listen_address  => '*',
      listen_port     => '4949',
      ignore_files    => [ 'DEADJOE$' ],
      pollers         => [ '^127\.0\.0\.1$' ],
    }

note: `munin::config` is included with defaults when running `include munin`. Default values will be used.

#### Plugins

Plugins can be enabled and disabled using `munin::plugin`.

    munin::plugin {
        ['cpu', 'load']:
            ensure => present,
            #ensure => absent,
    }

## Testing

    gem install bundler
    bundle install
    bundle exec rake

Run noop-tests:

    puppet apply --noop --verbose --modulepath=spec/fixtures/modules tests/init.pp

## Contribute

Send pull request and add tests. Make sure all tests pass (modify if you need) and make sure it's style-guide compliant.

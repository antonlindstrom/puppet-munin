require 'spec_helper'

describe 'munin::config', :type => :class do

  it { should contain_file('/etc/munin/munin-node.conf').with_ensure('present') }

end

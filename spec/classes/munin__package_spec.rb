require 'spec_helper'

describe 'munin::package', :type => :class do

  it { should contain_package('munin-node').with_ensure('present') }

end

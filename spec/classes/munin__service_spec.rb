require 'spec_helper'

describe 'munin::service', :type => :class do

  it { should contain_service('munin-node').with_ensure('running') }

end

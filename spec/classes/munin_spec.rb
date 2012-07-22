require 'spec_helper'

describe 'munin', :type => :class do

  it { should include_class('munin::package') }
  it { should include_class('munin::service') }
  it { should include_class('munin::config') }

end

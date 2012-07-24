require 'spec_helper'

describe 'munin::config', :type => :class do
  let(:facts) { {:fqdn => 'test.example.com' } }

  it { should contain_file('munin-node.conf').with_ensure('present') }

  it 'should contain passed variables in munin-node.conf' do
    content = catalogue.resource('file', 'munin-node.conf').send(:parameters)[:content]
    content =~ %r[host_name test\.example\.com]
    content =~ %r[host \*]
    content =~ %r[port 4949]
  end

end

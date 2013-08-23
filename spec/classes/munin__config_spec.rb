require 'spec_helper'

describe 'munin::config', :type => :class do
  let(:facts) { {:fqdn => 'test.example.com' } }

  it { should contain_file('munin-node.conf').with_ensure('present') }

  describe 'passed variables in munin-node.conf' do

    it 'should contain passed var host_name' do
      should contain_file('munin-node.conf').with_content(/host_name test\.example\.com/)
    end

    it 'should contain passed var host' do
      should contain_file('munin-node.conf').with_content(/host \*/)
    end

    it 'should contain passed var port' do
      should contain_file('munin-node.conf').with_content(/port 4949/)
    end

  end

end

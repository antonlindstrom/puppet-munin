require 'spec_helper'

describe 'munin::plugin', :type => :define do
  let(:title) { 'cpu' }

  describe 'plugin cpu on ArchLinux' do
    let(:facts) { {:operatingsystem => 'ArchLinux' } }

    it do should contain_file('/etc/munin/plugins/cpu').with( 
      'ensure'  => 'link',
      'target'  => '/usr/lib/munin/plugins/cpu'
    ) end
      
  end

  describe 'plugin cpu on Ubuntu' do
    let(:facts) { {:operatingsystem => 'Ubuntu' } }

    it do should contain_file('/etc/munin/plugins/cpu').with( 
      'ensure'  => 'link',
      'target'  => '/usr/share/munin/plugins/cpu'
    ) end
      
  end

  describe 'specific content' do
    let(:params) { { :config => 'test' } }
    it 'should include plugin cpu' do
      should contain_file('/etc/munin/plugin-conf.d/cpu.conf').with_content(/cpu/)
    end
  end

  describe 'ensure absent' do
    let(:params) { { :ensure => 'absent' } }

    it { should contain_file('/etc/munin/plugins/cpu').with_ensure('absent') }
    it { should contain_file('/etc/munin/plugin-conf.d/cpu.conf').with_ensure('absent') }
  end

end

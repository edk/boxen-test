require 'spec_helper'

describe 'vagrant::plugin' do
  let(:title) { 'vagrant-vmware-fusion' }
  let(:facts) { default_test_facts }

  it do
    should include_class('vagrant')

    should contain_vagrant_plugin('vagrant-vmware-fusion').
      with_ensure('present')
  end

  context 'name does not begin with vagrant-' do
    let(:title) { 'vmware-fusion' }

    it do
      should contain_vagrant_plugin('vagrant-vmware-fusion')
    end
  end

  context 'version specified' do
    let(:title) { 'vagrant-berkshelf' }
    let(:params) do
      {
        :version => '2.0.1'
      }
    end

    it do
      should contain_vagrant_plugin('vagrant-berkshelf').with_version('2.0.1')
    end
  end

  context 'with license' do
    let(:title) { 'vmware-fusion' }

    let(:params) do
      {
        :license => 'puppet:///foo/bar'
      }
    end

    it do
      should contain_file('/Users/testuser/.vagrant.d/license-vagrant-vmware-fusion.lic').with({
        :ensure => 'present',
        :mode   => '0644',
        :source => 'puppet:///foo/bar'
      })
    end
  end
end

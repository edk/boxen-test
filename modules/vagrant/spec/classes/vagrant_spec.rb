require 'spec_helper'

describe 'vagrant' do
  let (:facts) { default_test_facts }

  describe 'when not specifiying a version' do
    it { should contain_package('Vagrant_1.6.3').with({
      :ensure   => 'installed',
      :provider => 'pkgdmg'
    })}
  end

  describe 'when specifying a specific version' do
    let (:params) {{:version => '1.5.0'}}

    it { should contain_package('Vagrant_1.5.0')}
    it { should contain_package('Vagrant_1.5.0').with_source('https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.0.dmg')}
  end

  describe 'when installing bash completion' do
    let (:params) {{:completion => true}}

    it { should contain_package('Vagrant_1.6.3')}
    it { should contain_package('Vagrant_1.6.3').with_source('https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3.dmg')}
    it { should contain_package('vagrant-completion').with_provider('homebrew')}
  end

end

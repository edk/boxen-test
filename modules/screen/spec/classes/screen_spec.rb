require 'spec_helper'

describe 'screen' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser'
    }
  end

  it do
    should include_class('homebrew')

    should contain_homebrew__formula('screen').
      with_before('Package[boxen/brews/screen]')

    should contain_package('boxen/brews/screen').with({
      :ensure => '4.00.03-boxen1'
    })
  end
end

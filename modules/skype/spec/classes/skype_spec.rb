require 'spec_helper'

describe 'skype' do
  it do
    should contain_package('Skype').with({
      :provider => 'appdmg',
      :source   => 'http://download.skype.com/macosx/Skype_6.19.0.442.dmg',
    })
  end
end

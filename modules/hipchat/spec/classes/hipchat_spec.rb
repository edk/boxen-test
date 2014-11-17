require 'spec_helper'

describe 'hipchat' do
  it do
    should contain_class('hipchat')
    should contain_package('HipChat').with({
      :provider => 'compressed_app',
      :source   => 'https://www.hipchat.com/downloads/latest/mac',
      :flavor   => 'zip',
    })
  end
end

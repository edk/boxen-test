require 'spec_helper'

describe 'swig' do
  it do
    should include_class('pcre')

    should contain_package('swig').with({
      :require => 'Package[pcre]'
    })
  end
end

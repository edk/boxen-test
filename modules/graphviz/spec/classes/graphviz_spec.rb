require 'spec_helper'

describe 'graphviz' do
  it { should include_class('pkgconfig') }
  it { should include_class('swig') }

  it do
    should contain_package('graphviz').with({
      :require => [
        'Package[swig]',
        'Package[pkg-config]',
      ],
    })
  end
end

require 'spec_helper'

describe 'vagrant::box::vmware::squeeze64' do
  let(:facts) { default_test_facts }

  it do
    should contain_vagrant__box('squeeze64/vmware_fusion').
      with_source('https://s3.amazonaws.com/github-ops/vagrant/squeeze64-6.0.7-vmware_fusion.box')
  end
end

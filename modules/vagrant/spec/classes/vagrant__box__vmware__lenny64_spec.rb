require 'spec_helper'

describe 'vagrant::box::vmware::lenny64' do
  let(:facts) { default_test_facts }

  it do
    should contain_vagrant__box('lenny64/vmware_fusion').
      with_source('https://s3.amazonaws.com/github-ops/vagrant/lenny64-5.0.10-vmware_fusion.box')
  end
end

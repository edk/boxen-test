require 'spec_helper'

describe 'vagrant::box::vmware::wheezy64' do
  let(:facts) { default_test_facts }

  it do
    should contain_vagrant__box('wheezy64/vmware_fusion').
      with_source('https://s3.amazonaws.com/github-ops/vagrant/wheezy64-20130320-vmware_fusion.box')
  end
end

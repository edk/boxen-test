require 'spec_helper'

describe 'vagrant::box::vmware::precise64' do
  let(:facts) { default_test_facts }

  it do
    should contain_vagrant__box('precise64/vmware_fusion').
      with_source('http://files.vagrantup.com/precise64_vmware_fusion.box')
  end
end

require 'spec_helper'

describe 'vagrant::box' do
  let(:title) { "squeeze64" }
  let(:facts) { default_test_facts }
  let(:params) do
    {
      :source => "/foo/bar"
    }
  end

  it do
    should include_class('vagrant')

    should contain_vagrant_box("squeeze64").with({
      :source => "/foo/bar",
      :ensure => "present"
    })
  end

  context 'with ensure set to absent' do
    let(:params) do
      {
        :source => "/foo/bar",
        :ensure => "absent"
      }
    end

    it do
      should contain_vagrant_box("squeeze64").with({
        :source => "/foo/bar",
        :ensure => "absent"
      })
    end
  end
end

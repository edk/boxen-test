require 'spec_helper'

describe 'tmux' do

  let(:pre_condition) { "class homebrew {}" }

  it { should contain_class('tmux') }
  it { should contain_package('tmux') }

end

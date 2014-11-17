require 'spec_helper'

describe 'gpgme' do
  it { should contain_package('gpgme').with_ensure('latest') }
end

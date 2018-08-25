require 'spec_helper'
describe 'install' do

  context 'with defaults for all parameters' do
    it { should contain_class('install') }
  end
end

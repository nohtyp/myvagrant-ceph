require 'spec_helper'
describe 'ceph' do

  context 'with defaults for all parameters' do
    it { should contain_class('ceph') }
  end
end

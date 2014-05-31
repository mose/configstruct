# encoding: utf-8

require 'spec_helper'
require 'config_struct'

describe ConfigStruct do

  let(:options) { { basedir: File.expand_path('../../files', __FILE__) } }
  let(:value1) { 'newdefault' }

  describe '.default' do
    subject { ConfigStruct.new options }
    before { subject.default :var, value1 }
    it { expect(subject.var).to eq value1 }
  end

end

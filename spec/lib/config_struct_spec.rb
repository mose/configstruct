# encoding: utf-8

require 'spec_helper'
require 'config_struct'

describe ConfigStruct do

  let(:basedir) { File.expand_path('../../files', __FILE__) }
  let(:basefile) { File.expand_path('../../files/config.yml', __FILE__) }
  let(:options) { { basedir: basedir, basefile: basefile } }
  let(:value1) { 'newdefault' }

  describe '.default' do
    subject { ConfigStruct.new options }
    before { subject.default :var, value1 }
    it { expect(subject.var).to eq value1 }
  end

  describe 'new' do
    context 'when there is no config file, ' do
      let(:basefile) { File.expand_path('../../files/xxx.yml', __FILE__) }
      after { FileUtils.rm basefile if File.exist? basefile }
      subject { ConfigStruct.new options }
      it 'then a config file is created calling' do
        expect(subject.basefile).to eq basefile
        expect(File.exist? basefile).to be_true
      end
    end
  end

end

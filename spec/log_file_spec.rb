require 'spec_helper'
require 'log_file'

RSpec.describe LogFile do
  subject { described_class.new(file_path) }

  let(:file_path) { File.expand_path('fixtures/simple.log' , __dir__) }

  describe '#lines' do
    it 'returns lines from file without newlines' do
      expect(subject.lines).to eq(["/about/2 715.156.286.412"])
    end
  end

  describe '#entries' do
    it 'returns each line as parsed entry' do
      expect(subject.entries.size).to eq(1)
      expect(subject.entries.first.page_id).to eq('/about/2')
      expect(subject.entries.first.visitor_id).to eq('715.156.286.412')
    end
  end
end

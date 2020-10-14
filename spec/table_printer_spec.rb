require 'spec_helper'
require 'table_printer'

RSpec.describe TablePrinter do
  subject { described_class.new(data) }

  let(:data) do
    [
      ['this', 'is', 'row'],
      [1, 2, 3],
      ['looooooonger', 'word', 'in 1st col']
    ]
  end

  it 'prints array as console friendly string' do
    expected_output = <<-STR
      ------------------------------------
      | this         | is   | row        |
      | 1            | 2    | 3          |
      | looooooonger | word | in 1st col |
      ------------------------------------
    STR
    expected_output.gsub!(/^#{expected_output.scan(/^[ \t]*(?=\S)/).min}/, "")

    expect(subject.print).to eq(expected_output)
  end

  context 'no data' do
    let(:data) { [] }

    it 'prints only border when no data given' do
      expected_output = <<-STR
        -
        -
      STR
      expected_output.gsub!(/^#{expected_output.scan(/^[ \t]*(?=\S)/).min}/, "")

      expect(subject.print).to eq(expected_output)
    end
  end

  context 'with headers' do
    subject { described_class.new(data, headers: true) }

    let(:data) do
      [['first', 'second', 'third']] + super()
    end

    it 'prints array as console friendly string' do
      expected_output = <<-STR
        --------------------------------------
        | first        | second | third      |
        |------------------------------------|
        | this         | is     | row        |
        | 1            | 2      | 3          |
        | looooooonger | word   | in 1st col |
        --------------------------------------
      STR
      expected_output.gsub!(/^#{expected_output.scan(/^[ \t]*(?=\S)/).min}/, "")

      expect(subject.print).to eq(expected_output)
    end
  end
end

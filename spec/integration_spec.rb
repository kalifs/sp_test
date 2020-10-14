require 'spec_helper'

RSpec.describe 'bin/run' do
  let(:path) { File.expand_path('fixtures/multiple_entries.log', __dir__) }

  it 'prints total visits and unique visits per page' do
    output = `bin/run #{path}`

    expected_output = <<-STR

      Page views
      ----------------------
      | Page      | Visits |
      |--------------------|
      | /index    | 3      |
      | /contacts | 2      |
      | /about/2  | 1      |
      ----------------------

      Unique page views
      ----------------------------
      | Page      | Unique views |
      |--------------------------|
      | /contacts | 2            |
      | /about/2  | 1            |
      | /index    | 1            |
      ----------------------------
    STR
    expected_output.gsub!(/^#{expected_output.scan(/^[ \t]*(?=\S)/).min}/, '')
    expect(output).to eq(expected_output)
  end
end

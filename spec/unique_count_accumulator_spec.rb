require 'spec_helper'
require 'unique_count_accumulator'

RSpec.describe UniqueCountAccumulator do
  subject { described_class.new }

  it 'increases count by one by default' do
    subject.store('key1', group: 'a')
    expect(subject.to_a).to eq(
      [
        ['key1', 1]
      ]
    )
  end

  it 'accumulates multiple values and groups and returns them ordered by count' do
    subject.store('key1', group: 'a')
    subject.store('key1', group: 'b')
    subject.store('key1', group: 'c')
    subject.store('key2', group: 'a')
    subject.store('key2', group: 'a')
    subject.store('key2', group: 'b')
    subject.store('key3', group: 'a')

    expect(subject.to_a).to eq(
      [
        ['key1', 3],
        ['key2', 2],
        ['key3', 1]
      ]
    )
  end

  it 'returns ordered list by count descending and key ascending' do
    subject.store('key2', group: 'a')
    subject.store('key1', group: 'a')
    subject.store('key3', group: 'c')
    subject.store('key3', group: 'a')

    expect(subject.to_a).to eq(
      [
        ['key3', 2],
        ['key1', 1],
        ['key2', 1]
      ]
    )
  end
end

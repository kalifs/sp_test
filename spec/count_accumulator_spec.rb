require 'spec_helper'
require 'count_accumulator'

RSpec.describe CountAccumulator do
  subject { described_class.new }

  it 'accumulates count for given key' do
    subject.store('key1', 1)
    expect(subject.to_a).to eq(
      [
        ['key1', 1]
      ]
    )
  end

  it 'increases count by one by default' do
    subject.store('key1')
    expect(subject.to_a).to eq(
      [
        ['key1', 1]
      ]
    )
  end

  it 'accumulates multiple values and return them ordered by greatest count first' do
    subject.store('key1', 1)
    subject.store('key1', 1)
    subject.store('key2', 3)
    subject.store('key3', 1)

    expect(subject.to_a).to eq(
      [
        ['key2', 3],
        ['key1', 2],
        ['key3', 1]
      ]
    )
  end

  it 'returns ordered list by count descending key ascending' do
    subject.store('key2', 1)
    subject.store('key1', 1)
    subject.store('key3', 1)

    expect(subject.to_a).to eq(
      [
        ['key1', 1],
        ['key2', 1],
        ['key3', 1]
      ]
    )
  end
end

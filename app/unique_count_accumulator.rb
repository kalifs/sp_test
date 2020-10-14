require 'set'

class UniqueCountAccumulator
  def initialize
    @accumulator = {}
  end

  def store(key, group:)
    accumulator[key] ||= { groups: Set.new, count: 0 }
    accumulator[key][:count] += 1 if accumulator[key][:groups].add?(group)
  end

  def to_a
    accumulator
      .map { |key, value| [key, value[:count]] }
      .sort do |a, b|
      rel = b.last <=> a.last
      rel == 0 ? a.first <=> b.first : rel
    end
  end

  private

  attr_reader :accumulator
end

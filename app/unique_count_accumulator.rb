require 'set'

class UniqueCountAccumulator
  def initialize
    @accumulator = {}
  end

  def store(key, group:, count: 1)
    accumulator[key] ||= { groups: Set.new, count: 0 }
    if accumulator[key][:groups].add?(group)
      accumulator[key][:count] += count
    end
  end

  def to_a
    accumulator
    .map { |key, value| [key, value[:count]] }
    .sort { |a, b|
      rel = b.last <=> a.last
      rel == 0 ? a.first <=> b.first : rel
    }
  end

  private

  attr_reader :accumulator
end

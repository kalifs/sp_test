class CountAccumulator
  def initialize
    @accumulator = {}
  end

  def store(key, count = 1)
    accumulator[key] ||= 0
    accumulator[key] += count
  end

  def to_a
    accumulator.to_a.sort_by(&:last).reverse
  end

  private

  attr_reader :accumulator
end

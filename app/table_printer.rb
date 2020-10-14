class TablePrinter
  def initialize(data, headers: false)
    @data = data
    @headers = headers
  end

  def print
    output = [horizontal_border]
    data.each.with_index do |row, row_idx|
      line = []
      row.each.with_index do |value, col|
        line << " #{value}#{padding(value,col)} "
      end
      output << ('|' + line.join('|') + '|')
      output << header_divider if row_idx == 0 && headers
    end
    output << horizontal_border
    output.join("\n") + "\n"
  end

  private

  attr_reader :data, :headers

  def horizontal_border
    '-' * total_width
  end

  def header_divider
    '|' + '-' * (total_width - 2) + '|'
  end

  def total_width
    @total_width ||= col_sizes.sum + total_columns * 3 + 1
  end

  def padding(value, col)
    ' ' * (col_sizes[col] - value.to_s.size)
  end

  def total_columns
    data.first ? data.first.size : 0
  end

  def col_sizes
    @col_sizes ||= data.reduce([]) do |result, row|
      row.each.with_index do |value, col|
        result[col] = value.to_s.size if !result[col] || result[col] < value.to_s.size
      end
      result
    end
  end
end

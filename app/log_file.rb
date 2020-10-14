class LogFile
  def initialize(path)
    @path = path
  end

  def lines
    @lines ||= File.readlines(path).map(&:chomp)
  end

  def entries
    @entries ||= lines.each_with_object([]) do |line, results|
      line_args = line_to_args(line)
      next unless line_args

      results << LogEntry.new(**line_args)
    end
  end

  private

  attr_reader :path

  def line_to_args(line)
    parts = line.split(' ')
    return unless parts.size == 2

    {
      page_id: parts[0],
      visitor_id: parts[1]
    }
  end


  LogEntry = Struct.new(:page_id, :visitor_id, keyword_init: true)
end

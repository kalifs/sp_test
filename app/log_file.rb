class LogFile
  def initialize(path)
    @path = path
  end

  def lines
    @lines ||= File.readlines(path).map(&:chomp)
  end

  def entries
    @entries ||= lines.map do |line|
      LogEntry.new(**line_to_args(line))
    end
  end

  private

  attr_reader :path

  def line_to_args(line)
    parts = line.split(' ')
    {
      site: parts[0],
      visitor_id: parts[1]
    }
  end


  LogEntry = Struct.new(:site, :visitor_id, keyword_init: true)
end

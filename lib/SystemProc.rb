class SystemProc

  def self.create pid, filesystem
   data = filesystem::get_stat_data_for_pid pid
   proc = self.new(data[0], data[1])
   return proc
  end

  attr_reader :pid
  attr_reader :name

  private
  def initialize pid, name
    @pid = pid
    @name = parse_name name
  end

  def parse_name name
    name.gsub("(", "").gsub(")", "")
  end

end

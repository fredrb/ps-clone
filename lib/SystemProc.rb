class SystemProc

  def self.create pid
   file = File.open("/proc/#{pid}/stat") 
   data = file.read.strip.split(" ")
   proc = self.new(data[0], data[1])

   file.close
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

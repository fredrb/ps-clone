
class SystemProcess
  public
  def initialize path
    @path = path
  end

  def process
    file = File.open("#{@path}/stat")
    data = file.read.strip.split(" ")

    @pid = data[0]
    @name = self.parseName(data[1])

    file.close
  end

  def parseName name
    name.gsub("(", "").gsub(")", "")
  end

  attr_reader :pid
  attr_reader :name
end

def isProcessFolder? path, file
  File.directory?("#{path}/#{file}") and (file.to_i != 0)
end

def forEachProcess 
  Dir.foreach("/proc") { |d|
    if isProcessFolder?("/proc", d)
      p = SystemProcess.new "/proc/#{d}"
      p.process
      yield p
    end
  }
end

forEachProcess() { |p| puts "#{p.pid}\t#{p.name}" }

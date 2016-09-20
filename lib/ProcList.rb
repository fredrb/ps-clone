require_relative './SystemProc'

class ProcList

  def initialize filesystem
    @fs = filesystem
    @processes = filesystem.get_current_pids
    @count = @processes.count
  end

  def get_pid pid
    return SystemProc::create pid, @fs
  end

  def for_each_proc 
    @processes.each { |p|
      yield get_pid p
    }
  end

  attr_reader :count

end

require_relative './ProcFolder'

class ProcList

  def initialize filesystem, usermap
    @fs = filesystem
    @usermap = usermap
    @processes = filesystem.get_current_pids
    @count = @processes.count
  end

  def get_pid pid
    return ProcFolder::create pid, @fs, @usermap
  end

  def for_each_proc
    @processes.each { |p|
      yield get_pid p
    }
  end

  attr_reader :count

end

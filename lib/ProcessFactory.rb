require_relative './ProcessData'

class ProcessFactory

  def initialize filesystem
    @fs = filesystem
    @processes = filesystem.get_current_pids
    @count = @processes.count
  end

  def each_process
    @processes.each { |p|
      yield create_process p
    }
  end

  attr_reader :count

  private
  def create_process pid
    data = @fs::get_process_data pid

    name = data["name:"][0]
    user_id = data["uid:"][0]
    user = @fs::get_users[user_id]

    return ProcessData.new(pid, name, user)
  end

end

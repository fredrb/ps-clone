class ProcessData

  attr_reader :pid
  attr_reader :name
  attr_reader :user
  attr_reader :state
  attr_reader :command
  attr_reader :rss

  def initialize pid, name, user, state, command, rss
    @pid = pid
    @name = parse_name name
    @user = user
    @state = state
    @command = command
    @rss = rss
  end

  private
  def parse_name name
    name.gsub("(", "").gsub(")", "")
  end

end

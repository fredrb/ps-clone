class ProcFolder

  def self.create pid, filesystem, usermap
    name = filesystem::get_proc_name pid
    user_id = filesystem::get_uid pid
    user = usermap::get_user user_id[0]

    process = self.new(pid, name, user)
    return process
  end

  attr_reader :pid
  attr_reader :name
  attr_reader :user

  private
  def initialize pid, name, user
    @pid = pid
    @name = parse_name name
    @user = user
  end

  def parse_name name
    name.gsub("(", "").gsub(")", "")
  end

end

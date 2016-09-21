class ProcessData
  
  attr_reader :pid
  attr_reader :name
  attr_reader :user

  def initialize pid, name, user
    @pid = pid
    @name = parse_name name
    @user = user
  end

  private
  def parse_name name
    name.gsub("(", "").gsub(")", "")
  end

end

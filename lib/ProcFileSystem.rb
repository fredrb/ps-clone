class ProcFileSystem

  def self.get_current_pids
    
  end

  def self.get_stat_data_for_pid pid
   file = File.open("/proc/#{pid}/stat") 
   content = file.read
   file.close
   return content.strip.split(" ")
  end

end

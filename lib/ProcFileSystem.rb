class ProcFileSystem

  def self.is_process_folder? folder
    File.directory?("/proc/#{folder}") and (folder.to_i != 0)
  end

  def self.get_current_pids
    pids = []
    Dir.foreach("/proc") { |d|
      if is_process_folder?(d)
        pids.push(d)
      end
    }
    return pids
  end

  def self.get_stat_data_for_pid pid
    file = File.open("/proc/#{pid}/stat") 
    content = file.read
    file.close
    return content.strip.split(" ")
  end

end

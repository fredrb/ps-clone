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

  def self.get_proc_name pid
    file = File.open("/proc/#{pid}/stat")
    content = file.read
    file.close
    return content.strip.split(" ")[1]
  end

  def self.get_uid id
    File.open("/proc/#{id}/status") { |f|
      while line = f.readline
        data = line.strip.split("\t")
        if data[0] == "Uid:"
          return [data[1], data[2], data[3], data[4]]
        end
      end
    }
    return nil
  end

end

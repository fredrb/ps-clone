class FilesystemAdapter
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

  def self.get_process_data pid
    proc_data = {}
    File.open("/proc/#{pid}/status") { |file|
      begin
        while line = file.readline
          data = line.strip.split("\t")
          proc_data[data.delete_at(0).downcase] = data
        end
        file.close
      rescue EOFError
        file.close
      end
    }
    return proc_data
  end

  def self.get_users
    users = {}
    File.open("/etc/passwd", "r") { |file|
      begin
        while line = file.readline
          data = line.strip.split(":")
          users[data[2]] = data[0]
        end
        file.close
      rescue EOFError
        file.close
      end
    }
    return users
  end

  def self.get_command pid
    file = File.open("/proc/#{pid}/cmdline")
    cmdline = file.read.strip.slice(0, 30)
    file.close
    return cmdline
  end
end

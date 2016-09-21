class UserMap
  def self.get_user id
    File.open("/etc/passwd", "r") { |file|
      while line = file.readline
        data = line.strip.split(":")
        if data[2] == id
          return data[0]
        end
      end
      file.close
    }
    return nil
  end
end

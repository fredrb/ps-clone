require_relative '../lib/ProcessFactory.rb'
require_relative '../lib/FilesystemAdapter.rb'

processes = ProcessFactory.new FilesystemAdapter

format="%6s\t%-15s\t%-10s\t%-10s\t%-10s\t%-30s\n"
printf(format, "PID", "NAME", "USER", "STATE", "MEMORY", "COMMAND")
printf(format, "------", "---------------", "----------", "----------", "----------", "------------------------------")
processes.each_process { |p|
  printf(format, p.pid, p.name, p.user, p.state, p.rss, p.command)
}

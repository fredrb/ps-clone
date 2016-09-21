require_relative '../lib/ProcList.rb'
require_relative '../lib/ProcFileSystem.rb'
require_relative '../lib/UserMap.rb'

processes = ProcList.new ProcFileSystem, UserMap

format="%6s\t%-15s\t%-15s\n"
printf(format, "PID", "NAME", "USER")
printf(format, "------", "---------------", "---------------")
processes.for_each_proc { |p|
  printf(format, p.pid, p.name, p.user)
}

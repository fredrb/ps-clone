require_relative '../lib/SystemProc.rb'
require_relative '../lib/ProcFileSystem.rb'

proc = SystemProc::create("3201", ProcFileSystem)

puts proc.pid
puts proc.name

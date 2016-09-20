require_relative '../lib/ProcList.rb'
require_relative '../lib/ProcFileSystem.rb'

processes = ProcList.new ProcFileSystem

puts "PID\tNAME"
processes.for_each_proc { |p|
  puts "#{p.pid}\t#{p.name}"
}



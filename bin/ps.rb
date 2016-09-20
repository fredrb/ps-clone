require_relative '../lib/SystemProc.rb'

proc = SystemProc::create("3201")

puts proc.pid
puts proc.name

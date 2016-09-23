# ps-clone
A clone of unix ps program - reports a snapshot of the current processes; including: `Pid` `user` `state` and `memory consumption`


```
   PID	NAME           	USER      	STATE     	MEMORY    
------	---------------	----------	----------	----------
     1	systemd        	root      	S (sleeping)	 4316 kB
     2	kthreadd       	root      	S (sleeping)	
     ...

```

## Install
`gem install`

## Run
Executable is `bin/ps.rb`

## Proc Filesystem

All processes are read from Linux `/proc` folder. Every Pid subfolder contains data for each running process, general data can be found in file `/proc/<pid>/status`


#!/usr/bin/expect
# expect/TCL (http://expect.sourceforge.net/) script for reproducing 
# reloading problem in Grails 2.3.3.BUILD-SNAPSHOT
# shows error [Static type checking] - Cannot find matching method 
# MyController#render(java.util.LinkedHashMap <java.lang.String, java.lang.String>). 
# Please check if the declared type is right and if the method exists.
proc loadurl {} {
  system curl -sS -i http://localhost:8080/compilestatic-app/my/index    	
}
set timeout 60
exec git checkout f740e65bc grails-app/controllers/MyController.groovy
spawn bash --norc --noprofile
expect "$ "
send "rm -rf target\r"
expect "$ "
send "grails $argv -plain-output\r"
expect "grails>"
send "run-app\r"
expect "grails>"
puts "\nGrails started. Waiting 10 seconds..."
sleep 10
set timeout 10
puts "loading url...\n"
loadurl
puts "\nwaiting 10 seconds...\n"
sleep 10
puts "changing MyController.groovy\n"
exec git checkout aa71ff37 grails-app/controllers/MyController.groovy
expect "\n"
puts "waiting 10 seconds...\n"
sleep 10
puts "loading url...\n"
loadurl
sleep 5
puts "\nloading url 2nd time...\n"
loadurl
send "exit\r"
expect "$ "
exec git checkout HEAD grails-app/controllers/MyController.groovy
exit

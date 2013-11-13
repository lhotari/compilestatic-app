#!/usr/bin/expect
# expect/TCL (http://expect.sourceforge.net/) script for reproducing 
# reloading problem in Grails 2.3.3.BUILD-SNAPSHOT
# shows error [Static type checking] - Cannot find matching method 
# MyController#render(java.util.LinkedHashMap <java.lang.String, java.lang.String>). 
# Please check if the declared type is right and if the method exists.
set timeout 60
exec git checkout f740e65bc grails-app/controllers/MyController.groovy
spawn bash --norc --noprofile
expect "$ "
send "rm -rf target\r"
expect "$ "
send "grails -plain-output\r"
expect "grails>"
send "run-app\r"
expect "grails>"
sleep 10
set timeout 10
puts "loading url..."
exec curl -sS -i http://localhost:8080/compilestatic-app/my/index
expect "\n"
puts "changing MyController.groovy"
exec git checkout aa71ff37 grails-app/controllers/MyController.groovy
expect "\n"
puts "loading url..."
exec curl -sS -i http://localhost:8080/compilestatic-app/my/index
expect "\n"
sleep 5
send "exit\r"
expect "$ "
exec git checkout HEAD grails-app/controllers/MyController.groovy
exit

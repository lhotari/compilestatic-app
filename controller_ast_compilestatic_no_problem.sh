#!/bin/bash
trap 'echo "Reverting BuildConfig.groovy changes..."; git checkout HEAD grails-app/conf/BuildConfig.groovy' EXIT
echo 'Appending "grails.project.fork = false" to BuildConfig.groovy'
echo "grails.project.fork = false" >> grails-app/conf/BuildConfig.groovy
./controller_ast_compilestatic_problem.tcl


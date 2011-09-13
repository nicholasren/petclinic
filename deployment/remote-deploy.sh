#!/bin/sh
#the previous line indedicates which intepretor should be used to intepret following scrip
# this script is running on a go agent
# jobs:
#   1.copy artifcats to target node
#   3.restart server
#export target_username=root
#export target_ip=10.29.2.21
#export target_deploy_path=/home/ubuntu/projects/petclinic/tomcat/server

#copy release to target node
scp  ../target/petclinic.war $target_username@$target_ip:$target_deploy_path/webapps/

#deploy release
ssh $target_username@$target_ip "bash $target_deploy_path/bin/shutdown.sh && $target_deploy_path/bin/startup.sh "

#!/bin/sh
#the previous line indedicates which intepretor should be used to intepret following scrip
# this script is running on a go agent
# jobs:
#   1.copy artifcats to target node
#   3.restart server
#export target_username=root
#export target_ip=10.29.2.21
#export target_deploy_path=/home/ubuntu/projects/petclinic/tomcat/server
#export target_deploy_path=/var/lib/tomcat6/
#export target_jdbc_url=jdbc:mysql://10.29.2.21:3306/petclinic

#shutdown server
ssh $target_username@$target_ip "bash $target_deploy_path/bin/shutdown.sh"

#make a dir named in system time
time=$(date '+%Y%m%d%H%M%S' )
deploy_path=/tmp/$time
ssh $target_username@$target_ip "mkdir $deploy_path"

#copy release to target node
scp  target/petclinic.war $target_username@$target_ip:/tmp

#unpack package
ssh $target_username@$target_ip "unzip /tmp/petclinic.war -d $deploy_path"

#change database url
ssh $target_username@$target_ip "sed  's|jdbc.url=.*|jdbc.url=$target_jdbc_url|g' $deploy_path/WEB-INF/classes/jdbc.properties > jdbc.properties.modified"
ssh $target_username@$target_ip "mv jdbc.properties.modified $deploy_path/WEB-INF/classes/jdbc.properties"

#change symbol link to newer directory
ssh $target_username@$target_ip "unlink $target_deploy_path/webapps/petclinic && ln -s $deploy_path $target_deploy_path/webapps/petclinic"

#start server
ssh $target_username@$target_ip "bash $target_deploy_path/bin/startup.sh"

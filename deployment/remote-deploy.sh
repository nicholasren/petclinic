#!/bin/sh

# this script will be running on a go agent
# steps:
#  1) shutdown remote server
#  2) create a folder named in system time under /tmp
#  3) copy package to remote server
#  4) unzip package to the folder created in step 2
#  5) modify jdbc.properties, change database url to environment variable "$target_jdbc_url"
#  6) unlink deploied apps (if exists)
#  7) create a symbol link named "petclinic" to the folder created in step2 under <TOMCAT_HOME>/webapps/
#  8) start server
#

#these export is just for testing
#export target_username=root
#export target_ip=192.168.137.60
#export target_deploy_path=/tmp/tomcat6
#export target_jdbc_url=jdbc:mysql://192.168.137.60:3306/petclinic

time=$(date '+%Y%m%d%H%M%S' ) \
&& deploy_path=/tmp/$time \
&& ssh $target_username@$target_ip "bash $target_deploy_path/bin/shutdown.sh \
    && mkdir $deploy_path "\
&& scp  target/petclinic.war $target_username@$target_ip:/tmp \
&& ssh $target_username@$target_ip "unzip /tmp/petclinic.war -d $deploy_path \
    && sed  's|jdbc.url=.*|jdbc.url=$target_jdbc_url|g' $deploy_path/WEB-INF/classes/jdbc.properties > jdbc.properties.modified \
    && mv jdbc.properties.modified $deploy_path/WEB-INF/classes/jdbc.properties; \
    [[ -e $target_deploy_path/webapps/petclinic ]] && unlink $target_deploy_path/webapps/petclinic; \
    ln -s $deploy_path $target_deploy_path/webapps/petclinic \
    && bash $target_deploy_path/bin/startup.sh"

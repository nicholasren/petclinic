rm -rf  tomcat/server/webapps/petclinc.war  tomcat/server/webapps/petclinic/

mvn package

cp target/petclinic.war tomcat/server/webapps/
echo "copy succeed"

bash tomcat/server/bin/shutdown.sh &&  tomcat/server/bin/startup.sh
echo "server startted"
tail -f tomcat/server/logs/catalina.out

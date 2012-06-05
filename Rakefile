namespace :setup do
  task :db do
    url = ENV['url'] || "jdbc:mysql://localhost:3306/mysql"
    username = ENV['username'] || "root"
    password = ENV['password'] || ""
    system "mvn sql:execute -Durl=#{url} -Dusername=#{username} -Dpassword=#{password}"
  end

end

task :package do
  system "mvn package"
end

task :deploy => :package do
  system "cp target/petclinic.war tomcat/server/webapps/"
end

task :start => [:deploy, :clean] do
  system "tomcat/server/bin/shutdown.sh &&  tomcat/server/bin/startup.sh"
end

task :clean do
  system "rm -rf tomcat/server/webapps/petclinc.war tomcat/server/webapps/petclinic/"
end

namespace :quality do
  task :functional do
    system "mvn jbehave:run-stories-as-embeddables"
  end
end

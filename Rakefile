namespace :setup do
 task :db do
   url = ENV['url'] || "jdbc:mysql://localhost:3306/mysql"
   username = ENV['username'] || "root"
   password = ENV['password'] || ""
   system "mvn sql:execute -Durl=#{url} -Dusername=#{username} -Dpassword=#{password}"
 end
end

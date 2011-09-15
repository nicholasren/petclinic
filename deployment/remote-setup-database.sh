
#export jdbc_url="jdbc:mysql://localhost:3306/mysql"
#export jdbc_username="root"
#export jdbc_password=""
#set up database
#mvn sql:execute

mvn sql:execute -Durl=$jdbc_url -Dusername=$jdbc_username -Dpassword=$jdbc_password
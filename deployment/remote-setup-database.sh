
#export target_root_jdbc_url="jdbc:mysql://localhost:3306/mysql"
#export target_jdbc_username="root"
#export target_jdbc_password=""
#set up database
#mvn sql:execute

mvn sql:execute -Durl=$target_root_jdbc_url -Dusername=$target_jdbc_username -Dpassword=$target_jdbc_password -X

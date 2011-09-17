
#export target_root_jdbc_url="jdbc:mysql://192.168.137.60:3306/petclinic"
#export target_jdbc_username="pc"
#export target_jdbc_password="pc"
#set up database


mvn sql:execute -Durl=$target_root_jdbc_url -Dusername=$target_jdbc_username -Dpassword=$target_jdbc_password 

class app-server {

    $project_path = "~/IdeaProjects/petclinic/"
    
    # install mysql, openjdk, tomcat
    $wantedpackages = ["mysql-server", "openjdk-6-jdk", "tomcat6"]

    package { $wantedpackages: ensure => installed }

    service { "mysql":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Package["mysql-server"],
        restart => true
    }
    
    #create db script
    file { "/tmp/initDB.txt":
            source=> "${project_path}/src/main/resources/db/mysql/initDB.txt",
    }
    
    #populate db script
    file { "/tmp/populateDB.txt":
            source=> "${project_path}/src/main/resources/db/mysql/populateDB.txt",
    }

    #create db schema
    exec { "init-db":
        command => "mysql < /tmp/initDB.txt",
        path =>"/bin:/usr/bin",
    }
    
    #populate db
    exec { "populate-db":
        command => "mysql petclinic < /tmp/populateDB.txt",
        path =>"/bin:/usr/bin",
    }
    
    Exec['init-db'] <~ File['/tmp/initDB.txt'] <- Service['mysql']
    Exec['populate-db'] <~ File['/tmp/populateDB.txt'] <- Service['mysql']
    
}

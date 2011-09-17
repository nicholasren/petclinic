class app-server {

    # install mysql, openjdk, tomcat
    $wantedpackages = ["mysql-server", "openjdk-6-jdk", "tomcat6"]

    #package { $wantedpackages: ensure => installed }


    #change bind-address to load ip

    #start up service
    #service { "mysql":
    #    ensure => running,
    #    hasstatus => true,
    #    hasrestart => true,
    #    require => Package["mysql-server"],
    #    restart => true
    #}

    #create database user
    file {"/tmp/create_db.sql":
        source => "puppet:///modules/app-server/create_db.sql",
        #source => "/Users/reaapi/IdeaProjects/petclinic/deployment/modules/app-server/files/create_db.sql",
        ensure => present,
    }

}

class{'app-server':}

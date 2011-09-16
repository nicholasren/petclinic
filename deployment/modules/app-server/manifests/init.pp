class app-server {

    $project_path = "~/IdeaProjects/petclinic/"
    
    # install mysql, openjdk, tomcat
    $wantedpackages = ["mysql-server", "openjdk-6-jdk"]

    package { $wantedpackages: ensure => installed }

    service { "mysql":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
        require => Package["mysql-server"],
        restart => true
    }
}

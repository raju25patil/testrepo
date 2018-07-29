pipeline {
    agent any
    stages {
        /*stage('Build') {
            steps {
                sh '/usr/local/bin/gradle build'
            }
        }
         stage('Sonar Analysis') {
            steps {
                sh '/usr/local/bin/gradle sonarqube'
            }
        }*/
        
        stage('build-dockerimage') {
          steps {
               timeout(time:5, unit:'DAYS'){
                 input message: 'Want to build Dokcer Image ? '
                 sh './scripts/dockerbuild.sh'
               }
           } 
           post {
             success {
               echo 'Doker Image has been built and pushed to reposetory'
             }
           }
        }
        
    }
}

pipeline {
    agent any
    //building the war file 
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/bin/gradle build'
            }
        }
        
        //Running the sonar cube analysis
         stage('Sonar Analysis') {
            steps {
                sh '/usr/local/bin/gradle sonarqube'
            }
        }
        
        //Building the image from newly created app war file 
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

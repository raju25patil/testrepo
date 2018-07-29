pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Build') {
            steps {
              sh '/usr/local/bin/gradle build'
            }
        }
	stage('Test'){
	    steps {
		  sh './scripts/test.sh'
		}
             post {
                success {
                    echo 'Build and Test completed Successfully'
                   
                }
            }

         }

       stage('build-dockerimage') {


          steps {
                timeout(time:5, unit:'DAYS'){
                input message: 'Want to build Dokcer Image ? '
                }
          } 

          steps {
                  sh './scripts/dockerbuild.sh'
                }

          post {
                success {
                    echo 'Doker Image has been built and pushed to reposetory'
                    
                }
    }
}

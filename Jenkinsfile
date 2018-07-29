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
      }
}

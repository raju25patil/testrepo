pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Build') {
            steps {
              sh 'gradle build'
            }
        }
	stage('Test'){
	    steps {
		  sh './scripts/test.sh'
		}
        }
    }
}

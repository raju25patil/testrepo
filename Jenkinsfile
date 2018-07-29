pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/bin/gradle build'
            }
        }
         stage('Sonar Analysis') {
            steps {
                sh '/usr/local/bin/gradle sonarqube'
            }
        }
    }
}

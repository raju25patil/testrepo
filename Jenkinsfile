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
        }

	stage('Deliver for development') {
            when {
                branch 'dev-env'
            }
            stage('Build') {
                steps {
                  sh '/usr/local/bin/gradle build'
                }
            }

	    stage('Test'){
                steps {
                  sh './scripts/test.sh'
                }
            }
        }
        stage('Release for QA-enviornment') {
            when {
                branch 'test-env'
            }
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
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                  }
               }
            }
	    stage('Deployment On Release Environment') {

		steps {
                  sh './scripts/deployment-on-relase.sh'
                }
                post {
                  success {
                    echo 'Deployment is successfull on relase enviornment'
                  }
                }
            
            }          
        }
        stage('Creating Docker Image from the Release branch') {
           when {
                branch 'test-env'
            }
           steps {
             timeout(time:1, unit:'DAYS'){
               input message: 'Do you want to creat an Docker Image from Release branch ?'
             }
             sh './scripts/createImage-on-relase.sh'
           
            }
           post {
              success{
                echo 'Image creation complted. Access the Image from Image reposetory'
              }
              failure{
                echo 'Image creation failed...'
              }
           }
        }  
    }
}

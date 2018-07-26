pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh ''
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage('Deploying to stage'){
          steps {
            build job: 'deploy-to-stage'
          }
        }
        stage('Deploying to Production'){
          steps {
            timeout(time:5, unit:'DAYS'){
            input message: 'Approve Prodction Deployment ? '
            }

            build job: 'deploy-to-production'

          }
          post {
              success{
                echo 'Prod deployment complted'
              }
              failure{
                echo 'Prod deployment failed'
              }

          }
        }
    }
}

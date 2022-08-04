pipeline {
    environment {
      registry = "jfroginterviewtest.jfrog.io"
      registryCredential = 'sebastiancanevari@gmail.com'
      dockerImage = ''
    }
    agent { 
      docker { 
        image 'maven:3.8.4-openjdk-11-slim' 
      } 
    }
    stages {
      stage('Compile') {
         steps {
           sh 'mvn compile -Dcheckstyle.skip'
         }
      }
      stage('Test') {
        steps {
          sh '''
          mvn test
          ''' 
        }
      }
      stage('Building Image') {
        steps{
          dockerImage = registry + ":latest"
          sh('docker build -t ${dockerImage} .')
          echo('done')
        }
      }
    }
}

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

    }
    agent any
    stages {
      stage('Building Image') {
        steps{
          script {
            dockerImage = docker.build registry + ":latest"
          }
        }
      }
    }
}

pipeline {
    environment {
      registry = "jfroginterviewtest.jfrog.io"
      registryCredential = 'sebastiancanevari@gmail.com'
      dockerImage = ''
    }
    agent none 
    stages {
      stage('Compile') {
      agent {
        docker { 
          image 'maven:3.8.4-openjdk-11-slim'
        } 
      }
       steps {
         sh 'mvn compile -Dcheckstyle.skip'
         sh 'mvn test'
       }
      }
      stage('Building Image') {
        steps{
          script{
            dockerImage = registry + ":latest"
          }
          sh('docker build -t ${dockerImage} .')
          echo('done')
        }
      }
    }
}

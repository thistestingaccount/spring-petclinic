pipeline {
    environment {
      registry = "interview-jfrog-test/"
      registryCredential = '8b448488-b394-4508-bbec-e725ee6eed66'
      registryUri = 'https://jfroginterviewtest.jfrog.io/'
      registryBase "jfroginterviewtest.jfrog.io/""
      dockerImage = ''
    }
    agent any 
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
          script {
            dockerImage = docker.build registryBase + registry + "petclinic:latest"
          }
        }
      }
      stage('Deploy Image') {
        steps{
           script {
              docker.login()
              docker.withRegistry( registryUri, registryCredential ) {
              dockerImage.push()
            }
          }
        }
      }
    }
}

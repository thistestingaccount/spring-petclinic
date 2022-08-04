pipeline {
    agent { 
      docker { 
        image 'maven:3.8.6-openjdk-11-slim' 
      } 
    }
    stages {
      stage('Compile') {
         steps {
           sh 'mvn compile'
         }
      }
      stage('Test') {
        steps {
          sh '''
          mvn clean install
          ls
          pwd
          ''' 
        }
      }
    }
}

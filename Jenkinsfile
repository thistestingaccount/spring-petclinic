pipeline {
    agent { docker { image 'maven:3.8.4-openjdk-11-slim' } }
    stages {
      stage('Cloning Git') {
        steps {
          git 'https://github.com/thistestingaccount/spring-petclinic.git'
        }
      }
      stage('Compile') {
         steps {
           sh 'mvn compile'
         }
      }
    }
}

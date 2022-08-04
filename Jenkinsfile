pipeline {
    agent any
    tools {
      maven 'Maven 3.8.6'
      jdk 'jdk11'
    } 
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


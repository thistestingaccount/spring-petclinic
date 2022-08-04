pipeline {
    environment {
      registry = "jfroginterviewtest.jfrog.io"
      registryCredential = 'sebastiancanevari@gmail.com'
      dockerImage = ''
    }
    docker.image('maven:3.8.4-openjdk-11-slim').inside('-v $HOME/.m2:/root/.m2') {
      stage('Test') {
        steps {
          sh '''
          mvn test
          ''' 
        }
      }
      stages {
        stage('Compile') {
           steps {
             sh 'mvn compile -Dcheckstyle.skip'
           }
        }
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

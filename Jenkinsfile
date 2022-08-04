node {
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

    stage('build image') {
        docker.withRegistry(registry, registryCredential) {
            def myImage = docker.build('jenkins-docker-kubernetes/petclinic')
            myImage.push('latest')
        }    
    }
}

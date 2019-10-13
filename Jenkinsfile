pipeline {
  environment {
    registry = "loreye/static"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }


  agent any
  stages {

  stage('Build') {
    steps {
      sh 'echo "Hello world"'
    }
  }


    stage('Lint HTML') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    
  stage('Build Docker') {
      steps{
        script {
          dockerImage = docker.build registry + ":v1"
        }
      }
   }

  stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

//  stage('Push Docker Image') {
//     steps{
//         sh 'docker login -u loreye -p '
//         sh 'docker image tag static loreye/static'
//         sh 'docker image push loreye/static'
//      }
//  }

  // stage('Run Docker') {
  //   steps{
  //       sh 'docker run -d -p 3000:80 static'
  //    }
  //  }
  }
}

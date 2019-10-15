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
  
  stage('Deployment') {
    steps{
        // sh 'kubectl apply -f /var/lib/jenkins/workspace/devops_capstone_master/deployment.yaml'
        sh 'pwd'
        sh 'ls'
     }
   }

  stage('Run Docker') {
    steps{
        sh 'docker run -d -p 9090:80 loreye/static:v1'
     }
   }
  }
}

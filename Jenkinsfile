pipeline {
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
        sh 'docker build --tag=static .'
     }
   }

 stage('Push Docker Image') {
    steps{
        sh 'docker login' 
        sh 'docker image tag static loreye/static'
        sh 'docker image push loreye/static'
     }
 }



  stage('Run Docker') {
    steps{
        sh 'docker run -d -p 3000:80 static'
     }
   }
  }
}

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
        sh 'docker build -t webserver-image:v1 .'
     }
   }

  stage('Run Docker') {
    steps{
        sh 'docker run -d -p 80:80 webserver-image:v1'
     }
   }
  }
}

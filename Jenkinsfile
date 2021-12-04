pipeline {
  agent any
  stages {
    stage('git pull') {
      steps {
        sh 'echo "This is CICD Pipeline Demo"'
      }
    }

    stage('Unit Testing') {
      steps {
        sh 'npm test'
      }
    }

  }
}
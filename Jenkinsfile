pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        // Checkout the code from the GitHub repository
        checkout scm
      }
    }
    
    stage('Build') {
      steps {
        // Remove any warfiles already in the directory
        sh 'rm -rf *.war'
        // Compile the code and create the WAR file
        sh 'jar -cvf Prospective_Student_Survey_Helen_Glass.war *'
      }
    }
    
    stage('Docker Build') {
      steps {
        // Initialize Docker
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
        // Build the Docker image
        sh 'docker build -t helen-glass-tomcat-app .'
      }
    }
    
  }
}
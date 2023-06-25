def imageName = "helencglass/student-survey:${BUILD_TIMESTAMP}"

pipeline {
  agent any
  environment {
    DOCKERHUB_PASS = credentials('DOCKERHUB_PASS')
  }
  
  stages {

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
        // Build the Docker image
        sh "docker build -t ${imageName} ."
      }
    }

    stage('Docker Push') {
      steps {
        // Login to Dockerhub 
        sh "docker login -u helencglass -p ${DOCKERHUB_PASS}"
        // Build the Docker image
        sh "docker push ${imageName}"
      }
    }
    
  }
}
pipeline {
    agent {
        docker {
            image 'docker:24-dind'                      
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = "umeshsarki123/my-app"             
        IMAGE_TAG  = "${BUILD_NUMBER}"                  
        DOCKER_USER = credentials('docker-username')   
        DOCKER_PASS = credentials('docker-password')  
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out code from GitHub..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Logging in to Docker Hub..."
                sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                
                echo "Pushing Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully! Docker image pushed: ${IMAGE_NAME}:${IMAGE_TAG}"
        }
        failure {
            echo "Pipeline failed. Check the logs above for errors."
        }
    }
}

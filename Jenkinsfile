pipeline {
    agent {
        docker {
            image 'docker:24-dind'                 // Docker-in-Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // optional if using host socket
        }
    }

    environment {
        IMAGE_NAME = "my-app"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Run Docker Image') {
            steps {
                echo "Running Docker container from image..."
                sh "docker run --rm ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs above."
        }
    }
}

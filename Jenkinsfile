pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-app"
        IMAGE_TAG  = "${devops}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
    }
}

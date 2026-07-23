pipeline {

    agent any

    environment {
        IMAGE_NAME = "docker.io/dheerajvalecha/springboot-demo"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Image') {
            steps {
                sh 'podman build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deployment will be added in next lab'
            }
        }
    }
}

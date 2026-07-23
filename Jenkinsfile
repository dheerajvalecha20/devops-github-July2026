pipeline {

    agent any

    environment {
        IMAGE_NAME = "docker.io/dheerajvalecha/springboot-demo"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build JAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Image') {
            steps {
                sh 'sudo podman build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                    echo "$DOCKER_PASS" | sudo podman login docker.io \
                    -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'sudo podman push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        stage('List Images') {
            steps {
                sh 'sudo podman images'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment stage will be added later'
            }
        }

    }
}

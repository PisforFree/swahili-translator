pipeline {
    agent any

    environment {
        IMAGE_NAME = "pisforfree/swahili-translator"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Source already checked out by Jenkins'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-creds') {
                        docker.image("${IMAGE_NAME}").push()
                    }
                }
            }
        }
    }
}



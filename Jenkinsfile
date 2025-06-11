pipeline {
    agent any

    tools {
        git 'Default'
    }

    environment {
        IMAGE_NAME = "pisforfree/swahili-translator"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/PisforFree/swahili-translator.git'
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

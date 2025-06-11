pipeline {
    agent any

    environment {
        IMAGE_NAME = "pisforfree/swahili-translator"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/PisforFree/swahili-translator.git'
            }
        }

        stage('Docker Build and Push') {
            steps {
                script {
                    def image = docker.build("${IMAGE_NAME}")
                    docker.withRegistry('', 'docker-hub-creds') {
                        image.push()
                    }
                }
            }
        }
    }
}

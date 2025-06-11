pipeline {
    agent any

    environment {
        IMAGE_NAME = "pisforfree/swahili-translator"
    }

   stages {
  //  stage('Checkout Code') {
  //     steps {
  //          echo 'Cloning source code...'
  //          git 'https://github.com/PisforFree/swahili-translator.git'
  //     }
  // }

        stage('Docker Build') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                echo "Pushing image to Docker Hub..."
                script {
                    docker.withRegistry('', 'docker-hub-creds') {
                        docker.image("${IMAGE_NAME}").push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Something went wrong during the pipeline.'
        }
    }
}


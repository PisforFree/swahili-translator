pipeline {
    agent any

    environment {
        IMAGE_NAME = "swahili-translator"
        IMAGE_TAG = "v${BUILD_NUMBER}"
        FULL_IMAGE_NAME = "${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/your-org/swahili-translator.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh "docker build -t $FULL_IMAGE_NAME ."
                }
            }
        }

        stage('Test') {
            steps {
                echo "No tests defined yet — placeholder stage."
                // In future: sh "docker run --rm $FULL_IMAGE_NAME pytest tests/"
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh '''
                    # Stop and remove old container if it exists
                    docker rm -f translator || true
                    
                    # Run the new container
                    docker run -d --name translator -p 5000:5000 $FULL_IMAGE_NAME
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}



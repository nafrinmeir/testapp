pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build and tag the Docker image
                    docker.build("nginx-custom")
                }
            }
        }

        stage('Run Nginx Container') {
            steps {
                script {
                    // Run the Nginx container
                    docker.image("nginx-custom").run('-p 8080:80', '--name nginx-container -d')
                }
            }
        }

        stage('Modify Nginx Content') {
            steps {
                script {
                    // Use docker exec to modify the Nginx content
                    docker.image("nginx-custom").inside("--workdir /usr/share/nginx/html") {
                        sh 'echo "This Is Sparta" > index.html'
                    }
                }
            }
        }
    }

    post {
        always {
            // Cleanup: stop and remove the Nginx container
            script {
                docker.image("nginx-custom").stop()
                docker.image("nginx-custom").remove()
            }
        }
    }
}

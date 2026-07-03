pipeline {
    agent any

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source from GitHub...'
                checkout scm
            }
        }

        stage('Validate') {
            steps {
                echo 'Validating website files exist...'
                sh '''
                    test -f index.html
                    test -f css/style.css
                    test -f js/script.js
                    echo "All required files present."
                '''
            }
        }

        stage('Archive') {
            steps {
                echo 'Archiving build artifacts...'
                archiveArtifacts artifacts: '**/*.html,css/**,js/**', fingerprint: true
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t abc-technologies:${BUILD_NUMBER} .'
                sh 'docker tag abc-technologies:${BUILD_NUMBER} abc-technologies:latest'
            }
        }

        stage('Docker Run (smoke test)') {
            steps {
                echo 'Running container to verify it starts correctly...'
                sh '''
                    docker rm -f abc-technologies-test || true
                    docker run -d --name abc-technologies-test -p 8081:80 abc-technologies:latest
                    sleep 3
                    curl -f http://localhost:8081/ || (echo "Site did not respond" && exit 1)
                    docker rm -f abc-technologies-test
                '''
            }
        }

        // Kubernetes deploy and monitoring stages will be added
        // in the next steps of the pipeline (Assignment Step 4 onward).
    }

    post {
        success {
            echo 'Build completed successfully.'
        }
        failure {
            echo 'Build failed — check the console output above.'
        }
    }
}

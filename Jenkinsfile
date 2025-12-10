pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-cred')
        DOCKER_IMAGE = "noormezgar/projetstudentsmanagement"
        BRANCH = "master"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: "${BRANCH}",
                    url: 'https://github.com/Noormezgar/ProjetStudentsManagement-DevOps.git'
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ${DOCKER_IMAGE}:latest .
                """
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh """
                echo "${DOCKERHUB_CREDENTIALS_PSW}" | docker login -u "${DOCKERHUB_CREDENTIALS_USR}" --password-stdin
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                sh """
                docker push ${DOCKER_IMAGE}:latest
                """
            }
        }

        stage('Archive Artefacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully ! 🎉"
        }
        failure {
            echo "Pipeline failed ❌"
        }
    }
}

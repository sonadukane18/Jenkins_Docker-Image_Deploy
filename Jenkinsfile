pipeline {
    agent any

    stages {
        stage('Build app') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                          userRemoteConfigs: [[url: 'https://github.com/sonadukane18/Jenkins_Docker_Demo_Repo.git']]])
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t jenkinsdocker .'
                }
            }
        }

        stage('Rename Image Tag') {
            steps {
                script {
                    bat 'docker tag jenkinsdocker sonadukane18/jenkinsdockerapp:image'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "docker login -u sonadukane18 -p Kashmir@25"
                        bat 'docker push sonadukane18/jenkinsdockerapp:image'
                    }
                }
            }
        }
    }
}

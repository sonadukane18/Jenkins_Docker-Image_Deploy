pipeline {
    agent any

    stages {
        stage('Build app') {
            steps {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sonadukane18/Jenkins_Docker_Demo_Repo.git']])
                
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
                    
                        bat "docker login -u sonadukane18 -p Kashmir@25"
                        bat 'docker push sonadukane18/jenkinsdockerapp:image'
                    
                }
            }
        }
    }
}

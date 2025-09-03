pipeline {
    agent any
    
    tools {
        maven 'Maven3'  
    }
    
    stages{
        
        stage('Build maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ezehsampson1/simple-java-app']])
                sh 'mvn clean install'
            }
        }

        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t simple-java-app-private .'
                }
            }
        }

        stage('Push image to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 927788617166.dkr.ecr.us-east-1.amazonaws.com
                    docker tag simple-java-app-private:latest 927788617166.dkr.ecr.us-east-1.amazonaws.com/simple-java-app-private:latest
                    docker push 927788617166.dkr.ecr.us-east-1.amazonaws.com/simple-java-app-private:latest
                '''
            }
        }
        
    }
    
    post {
        success {
            echo '✅ Build successful! .jar file archived and ready for download'
        }
        failure {
            echo '❌ Build failed. Check console output for errors!'
        }
    }
}
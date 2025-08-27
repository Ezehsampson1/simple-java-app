pipeline {
    agent any
    
    tools {
        git 'Default'
        maven 'Maven3'
    }
    
    stages {
    
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ezehsampson1/simple-java-app.git'
            }
        }
        
        stage('Build') {
            steps {
                bat 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                bat 'mvn package'
            }
        }
        
    }
    
    post {
       success {
            echo '✅ Build successful! .jar file archived and ready for download'
        }
        failure {
            echo '❌ Build failed. Check console output for errors'
        }
    }
}
pipeline {
    agent any
    
    tools {
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
                sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                sh 'mvn package'
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
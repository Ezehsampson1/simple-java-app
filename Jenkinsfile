pipeline {
    agent any

    tools {
        maven 'Maven3'       // Make sure "Maven3" is installed & configured in Jenkins
        jdk 'Java11'         // Make sure "Java11" is installed & configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ezehsampson1/simple-java-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Archive Jar') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Build successful! .jar file archived and ready for download.'
        }
        failure {
            echo '❌ Build failed. Check console output for errors.'
        }
    }
}

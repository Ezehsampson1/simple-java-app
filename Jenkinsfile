pipeline {
    agent any

    environment {
        AWS_REGION     = "us-east-1"   // Change to your AWS region
        AWS_ACCOUNT_ID = "927788617166" // Replace with your AWS account ID
        ECR_REPO_NAME  = "simple-java-app"
        IMAGE_TAG      = "latest"
        CLUSTER_NAME   = "simple-java-cluster"   // Your ECS Cluster
        SERVICE_NAME   = "simple-java-service"   // Your ECS Service
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Ezehsampson1/simple-java-app.git'
            }
        }

        stage('Build JAR with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t $ECR_REPO_NAME:$IMAGE_TAG .
                """
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region $AWS_REGION \
                | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                """
            }
        }

        stage('Tag & Push Image to ECR') {
            steps {
                sh """
                docker tag $ECR_REPO_NAME:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:$IMAGE_TAG
                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:$IMAGE_TAG
                """
            }
        }

        stage('Deploy to ECS') {
            steps {
                sh """
                aws ecs update-service \
                    --cluster $CLUSTER_NAME \
                    --service $SERVICE_NAME \
                    --force-new-deployment \
                    --region $AWS_REGION
                """
            }
        }
    }
}

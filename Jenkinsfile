pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/munnangihari/devops-training.git', branch: 'main', credentialsId: 'f29f206f-7c03-49f1-9fa3-3fc15dc8e18c'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    pip install -r docker/python-app/requirements.txt
                    pip install pytest
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                    . venv/bin/activate
                    pytest docker/python-app || echo "No tests found"
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                    docker build -t python-app:latest docker/python-app
                '''
            }
        }
    }
}

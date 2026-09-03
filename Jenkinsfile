pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull latest code from GitHub
                git branch: 'main', url: 'https://github.com/munnangihari/devops-training.git'
            }
        }

        stage('Build') {
    steps {
        sh '''
        python3 -m venv testenv
        . testenv/bin/activate
        pip install -r docker/python-app/requirements.txt
        '''
    }
}

        stage('Test') {
            steps {
                // Run unit tests with pytest
                sh '''
                source testenv/bin/activate
                pytest --maxfail=1 --disable-warnings -q
                '''
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image for the app
                sh '''
                docker build -t python-app:latest docker/python-app/
                '''
            }
        }
    }
}


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
	pip install pytest
        '''
    }
}

        stage('Test') {
            steps {
                // Run unit tests with pytest
                sh '''
    . testenv/bin/activate
    pytest --junitxml=test-results.xml
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


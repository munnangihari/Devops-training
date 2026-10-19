pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/yourname/linux-devops.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r docker/python-app/requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest docker/python-app'
            }
        }

        stage('Build') {
            steps {
                sh 'python docker/python-app/setup.py sdist bdist_wheel'
            }
        }
    }
}


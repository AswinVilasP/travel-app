pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the source code from the Git repository
                checkout scm
            }
        }

        stage('Setup Environment') {
            steps {
                // Create a virtual environment if it doesn't exist and install dependencies
                sh '''
                if [ ! -d "venv" ]; then
                  python3 -m venv venv
                fi
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }

        stage('Postgres DB images') {
            steps {
                sh 'docker build -t postgresdb:latest db/'
            }
        }

        stage('Django app image') {
            steps {
                sh 'docker build -t django-app:latest .'
            }
        }
        stage('Docker images') {
            steps {
                sh 'docker images -a'
            }
        }

        stage('Docker network') {
            steps {
                sh 'docker network create web-network'
            }
        }

        stage('Postgres container') {
            steps {
                sh 'docker run --name postgres --network web-network -p 5432 -d postgresdb:latest'
            }
        }

        stage('Django container') {
            steps {
                sh 'docker run --name travel-app --network web-network -p 8000:8000 -d django-app:latest'
            }
        }

    }
    
}

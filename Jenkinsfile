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
    }
    
}

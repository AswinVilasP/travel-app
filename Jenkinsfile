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

        stage('Docker compose') {
            steps {
                sh 'docker compose up --build -d'
            }
        }

        stage('Docker images') {
            steps {
                sh 'docker images -a'
            }
        }

        stage('Docker containers') {
            steps {
                sh 'docker ps -a'
            }
        }

        stage('Deleting containers & images') {
            steps {
                sh 'docker compose down'
                sh 'docker system prune -af'
                sh 'docker ps -a'
                sh 'docker images -a'
            }
        }

        // stage('exporting Artifact') {
        //     steps {
        //         sh 'ssh aswinvilasp@192.168.134.189 "rm -rf /home/aswinvilasp/DevOps/jenkins/*"'
        //         sh 'scp -r ${WORKSPACE}/* aswinvilasp@192.168.1.242:/home/aswinvilasp/DevOps/jenkins'
        //     }
        // }

        // stage('SSH Commands execution') {
        //     steps {
        //         sh '''
        //             ssh -T aswinvilasp@192.168.134.189 <<EOF
        //                 cd /home/aswinvilasp/DevOps/jenkins
        //                 docker compose up --build -d
        //                 exit
        //             EOF
        //         ''' 
        //     }
        // }

        stage('Tagging & pushing to dockerhub') {
            steps {
                // sh '''
                // ssh -T aswinvilasp@192.168.134.189 <<EOF
                // cd /home/aswinvilasp/DevOps/jenkins
                // chmod +x tag.sh
                ./tag.sh
                exit
                    // EOF
                // ''' 
            }
        }
    } 
}

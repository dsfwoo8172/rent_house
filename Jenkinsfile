pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent {
                docker {
                    image = 'ruby:3.3'
                }
            }
            steps {
                sh '''
                    echo 'Building..'
                    uname -a
                '''
            }
        }
        stage('Test') {
            agent {
                docker {
                    image = 'ruby:3.3'
                }
            }
            steps {
                sh '''
                    echo 'Testing..'
                    uname -a
                '''
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image = 'ruby:3.3'
                }
            }
            steps {
                sh '''
                    echo 'Deploying....'
                    uname -a
                '''
            }
        }
    }
}
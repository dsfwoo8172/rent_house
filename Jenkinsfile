pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'ruby:3.3'
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
                    image 'ruby:3.3'
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
                    image 'ruby:3.3'
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
    post {
        success {
            dingtalk (
                robot: '4d1055b4-43e9-4536-b445-aa0b80d62c44',
                text: ['Build Success']
            )
        }
        failure {
            dingtalk (
                robot: '4d1055b4-43e9-4536-b445-aa0b80d62c44',
                text: ['Build Failed']
            )
        }
    }
}
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
                robot: '浪Live小幫手(測試)@機器人',
                type: 'MARKDOWN',
                text: [
                    '### Build Success',
                    '#### 測試',
                    '#### 測試',
                    '#### 測試',
                    '#### 測試'
                ]
            )
        }
        failure {
            dingtalk (
                robot: '浪Live小幫手(測試)@機器人',
                type: 'MARKDOWN',
                text: [
                    '### Build Failed',
                    '#### 測試',
                    '#### 測試',
                    '#### 測試',
                    '#### 測試'
                ]
            )
        }
    }
}
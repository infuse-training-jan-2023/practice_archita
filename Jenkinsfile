pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Test') {
            steps {
                bat '''ruby testCases.rb'''
            }
        }
    }
}

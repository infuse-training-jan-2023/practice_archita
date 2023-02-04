pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Build') {
            steps {
                bat '''ruby printArrayElements.rb'''
            }
        }

        stage('Test') {
            steps {
                bat '''ruby testCases.rb'''
            }
        }
    }
}
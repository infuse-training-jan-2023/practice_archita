pipeline {
    agent any

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
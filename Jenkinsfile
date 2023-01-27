pipeline {
    agent any

    stages {
        stage('Build') {
            bat '''ruby printArrayElements.rb'''
        }

        stage('Test') {
            bat '''testCases.rb'''
        }
    }
}
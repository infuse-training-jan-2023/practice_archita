pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Run') {
            steps {
                bat '''ruby testCases.rb'''
            }
        }
    }
}
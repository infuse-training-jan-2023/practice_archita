pipeline {
    agent {label 'jenkins-slave-archita'}

    stages {
        stage('Build') {
            steps {
                bat '''javac DuplicateCharacters.java'''
            }
        }

        stage('Run') {
            steps {
                bat '''java DuplicateCharacters'''
            }
        }
    }
}